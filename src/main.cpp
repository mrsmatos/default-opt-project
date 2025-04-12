#include "../include/default/typedef.hpp"

int main() {
    std::cout << "Hello from C++ test program using optimization libraries!" << std::endl;

    // === Boost example ===
    boost::adjacency_list<> g;
    auto v1 = add_vertex(g);
    auto v2 = add_vertex(g);
    add_edge(v1, v2, g);
    std::cout << "Boost Graph created with 2 vertices and 1 edge." << std::endl;

    // === CPLEX example ===
    try {
        IloEnv env;
        IloModel model(env);
        IloNumVar x(env, 0, 1, ILOFLOAT);
        model.add(IloMaximize(env, x));
        IloCplex cplex(model);
        cplex.solve();
        std::cout << "CPLEX solved trivial model. Solution x = " << cplex.getValue(x) << std::endl;
        env.end();
    } catch (IloException& e) {
        std::cerr << "CPLEX error: " << e.getMessage() << std::endl;
    }

    // === Gurobi example ===
    try {
        GRBEnv env = GRBEnv(true);
        env.set("LogFile", "");
        env.start();
        GRBModel model = GRBModel(env);
        GRBVar x = model.addVar(0.0, 1.0, 0.0, GRB_CONTINUOUS, "x");
        model.setObjective(GRBLinExpr(x), GRB_MAXIMIZE);
        model.optimize();
        std::cout << "Gurobi solved trivial model. Solution x = " << x.get(GRB_DoubleAttr_X) << std::endl;
    } catch (GRBException& e) {
        std::cerr << "Gurobi error: " << e.getMessage() << std::endl;
    }

    // === SCIP example ===
    SCIP* scip = nullptr;
    if (SCIPcreate(&scip) == SCIP_OKAY) {
        SCIPincludeDefaultPlugins(scip);
        SCIPcreateProbBasic(scip, "hello_scip");
        SCIPsolve(scip);
        std::cout << "SCIP initialized and solved empty problem." << std::endl;
        SCIPfree(&scip);
    } else {
        std::cerr << "SCIP failed to initialize." << std::endl;
    }

    // === Lemon example ===
    lemon::ListDigraph graph;
    lemon::ListDigraph::Node n1 = graph.addNode();
    lemon::ListDigraph::Node n2 = graph.addNode();
    lemon::ListDigraph::Arc a = graph.addArc(n1, n2);
    lemon::ListDigraph::ArcMap<int> length(graph);
    length[a] = 1;
    lemon::Dijkstra<lemon::ListDigraph, lemon::ListDigraph::ArcMap<int>> dijkstra(graph, length);
    dijkstra.run(n1);
    std::cout << "Lemon Dijkstra distance from n1 to n2: " << dijkstra.dist(n2) << std::endl;

    return 0;
}
