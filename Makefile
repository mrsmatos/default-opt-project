
SYSTEM     = x86-64_linux
PLATFORM   = linux64
LIBFORMAT  = static_pic

CC        = g++
CCOPT     = -std=c++17 -O3 -ftree-vectorize -mfpmath=sse -march=native -flto -g -m64 -fPIC -fexceptions -DNDEBUG -DIL_STD -Wno-deprecated-declarations -Wno-macro-redefined

BOOST_HOME = /opt/boost_1_87_0
GUROBI_HOME = /opt/gurobi1201/linux64
CPLEXDIR = /opt/ibm/ILOG/CPLEX_Studio2211/cplex
CONCERTDIR = /opt/ibm/ILOG/CPLEX_Studio2211/concert
SCIPDIR = /opt/scipopt

CPLEXLIBDIR = $(CPLEXDIR)/lib/$(SYSTEM)/$(LIBFORMAT)
CPLEXINCDIR = $(CPLEXDIR)/include
CONCERTLIBDIR = $(CONCERTDIR)/lib/$(SYSTEM)/$(LIBFORMAT)
CONCERTINCDIR = $(CONCERTDIR)/include
SCIPLIBDIR = $(SCIPDIR)/lib
SCIPINCDIR = $(SCIPDIR)/include

CLIB = -L$(GUROBI_HOME)/lib/ -lgurobi_c++ -lgurobi120 -lm \
       -L$(CPLEXLIBDIR) -lilocplex -lcplex \
       -L$(CONCERTLIBDIR) -lconcert -lpthread -ldl \
       -L$(SCIPLIBDIR) -lscip -lemon

INC  = -I$(GUROBI_HOME)/include/ -I$(CPLEXINCDIR) -I$(CONCERTINCDIR) -I$(BOOST_HOME) -I$(SCIPINCDIR) -I./include/default

OBJDIR = ./obj
SRCDIR = ./src/default

OBJS = $(OBJDIR)/BaseClass.o $(OBJDIR)/DerivedClass1.o $(OBJDIR)/DerivedClass2.o $(OBJDIR)/PolyDerived.o $(OBJDIR)/main.o

all: $(OBJDIR) test_program

$(OBJDIR):
	mkdir -p $(OBJDIR)

test_program: $(OBJS)
	$(CC) $(CCOPT) $(OBJS) -o test_program $(CLIB)

$(OBJDIR)/main.o: src/main.cpp
	$(CC) $(CCOPT) -c src/main.cpp -o $(OBJDIR)/main.o $(INC)

$(OBJDIR)/BaseClass.o: $(SRCDIR)/BaseClass.cpp
	$(CC) $(CCOPT) -c $(SRCDIR)/BaseClass.cpp -o $(OBJDIR)/BaseClass.o $(INC)

$(OBJDIR)/DerivedClass1.o: $(SRCDIR)/DerivedClass1.cpp
	$(CC) $(CCOPT) -c $(SRCDIR)/DerivedClass1.cpp -o $(OBJDIR)/DerivedClass1.o $(INC)

$(OBJDIR)/DerivedClass2.o: $(SRCDIR)/DerivedClass2.cpp
	$(CC) $(CCOPT) -c $(SRCDIR)/DerivedClass2.cpp -o $(OBJDIR)/DerivedClass2.o $(INC)

$(OBJDIR)/PolyDerived.o: $(SRCDIR)/PolyDerived.cpp
	$(CC) $(CCOPT) -c $(SRCDIR)/PolyDerived.cpp -o $(OBJDIR)/PolyDerived.o $(INC)

clean:
	rm -f $(OBJDIR)/*.o test_program
	rm -rf build/*
