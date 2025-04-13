#ifdef GCC_VERSION
#undef GCC_VERSION
#endif

// Lemon
#include <lemon/list_graph.h>
#include <lemon/dijkstra.h>

#include <iostream>

// Boost
#include <boost/graph/adjacency_list.hpp>

// CPLEX
#include <ilcplex/ilocplex.h>
ILOSTLBEGIN

// Gurobi
#include "gurobi_c++.h"

// SCIP
#include <scip/scip.h>
#include <scip/scipdefplugins.h>



#define VAR 1e+75
enum problem_type { VAL_1 = 1, VAL_2 = 2, VAL_3 = 3 };
