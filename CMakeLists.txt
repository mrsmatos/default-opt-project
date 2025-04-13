cmake_minimum_required(VERSION 3.10)
project(DefaultOptimizationProject CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Diretórios de includes
include_directories(
    include/default
    /opt/gurobi1201/linux64/include
    /opt/ibm/ILOG/CPLEX_Studio2211/cplex/include
    /opt/ibm/ILOG/CPLEX_Studio2211/concert/include
    /opt/scipopt/include
    /opt/boost_1_87_0
    /opt/lemon-1.3.1/include
)

# Diretórios de bibliotecas
link_directories(
    /opt/gurobi1201/linux64/lib
    /opt/ibm/ILOG/CPLEX_Studio2211/cplex/lib/x86-64_linux/static_pic
    /opt/ibm/ILOG/CPLEX_Studio2211/concert/lib/x86-64_linux/static_pic
    /opt/scipopt/lib
    /opt/lemon-1.3.1/lib
)

# Fontes
set(SOURCES
    src/main.cpp
    src/default/BaseClass.cpp
    src/default/DerivedClass1.cpp
    src/default/DerivedClass2.cpp
    src/default/PolyDerived.cpp
)

add_executable(test_program ${SOURCES})

# Linkagem com bibliotecas
target_link_libraries(test_program
    gurobi_c++
    gurobi120
    ilocplex
    cplex
    concert
    scip
    lemon
    pthread
    dl
    m
)

# Direciona o executável final para a raiz do projeto
set_target_properties(test_program PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}
)

# Suprimir avisos de uso de APIs obsoletas (como std::iterator no Lemon)
target_compile_options(test_program PRIVATE
    -Wno-deprecated-declarations
    -Wno-macro-redefined
)
