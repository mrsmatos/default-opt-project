
# DefaultOptimizationProject

Este projeto é um **esqueleto base em C++** para desenvolvimento de aplicações que integram bibliotecas de otimização e grafos. Ele foi projetado para facilitar o início de novos projetos acadêmicos ou industriais, oferecendo uma estrutura organizada, modular e multiplataforma.

## ✅ Funcionalidades

- Estrutura padrão com `src/`, `include/`, `obj/`, `build/` e `Makefile`
- Suporte a compilação via **Make** ou **CMake**
- Geração do executável diretamente na **raiz do projeto**
- Exemplo funcional utilizando as seguintes bibliotecas:
  - [Boost Graph Library](https://www.boost.org/)
  - [CPLEX](https://www.ibm.com/products/ilog-cplex-optimization-studio)
  - [Gurobi](https://www.gurobi.com/)
  - [SCIP](https://scipopt.org/)
  - [LEMON](https://lemon.cs.elte.hu/)

---

## 🧪 Pré-requisitos

Certifique-se de que as seguintes bibliotecas estão instaladas e acessíveis:

- Boost 1.87.0
- CPLEX Studio 22.1.1
- Gurobi 12.0.1
- SCIPOptSuite
- Lemon (instalado em `/opt/lemon`)

---

## ⚙️ Compilação

### 🔧 Usando Make

```bash
make
```

### 🔧 Usando CMake

```bash
cmake -S . -B build
cmake --build build
```

> O executável `test_program` será gerado na raiz do projeto.

---

## 🚀 Execução

```bash
./test_program
```

---

## 📁 Estrutura

```
DefaultOptimizationProject/
├── bash/               # Scripts de execução para testes (ex: run_wsn.sh)
├── build/              # Diretório de build gerado pelo CMake
├── CMakeLists.txt      # Script de build CMake (compilação moderna e portátil)
├── data/               # Conjuntos de dados para testes e benchmarks
│   ├── CaRSlib/        # Instâncias CaRSlib
│   ├── CitiesLib/      # Instâncias CitiesLib
│   ├── PRPLib/         # Instâncias PRPLib
│   └── WSN/            # Instâncias para problemas de redes de sensores
├── include/            # Cabeçalhos do projeto (.hpp / .h)
│   ├── default/        # Headers das classes principais e base
│   │   ├── BaseClass.hpp
│   │   ├── DerivedClass1.hpp
│   │   ├── DerivedClass2.hpp
│   │   ├── PolyDerived.hpp
│   │   ├── typedef.hpp  # Tipos e definições globais
│   │   └── files.hpp
│   ├── exact/          # Headers específicos para métodos exatos
│   │   └── files.h
│   └── heuristic/      # Headers para métodos heurísticos
│       └── files.h
├── logs/               # Saídas e arquivos de log gerados durante a execução
├── Makefile            # Script de build alternativo via Make (manual e direto)
├── modules/            # Scripts auxiliares em Python (ex: análises por tempo)
│   ├── func_by_time.py
│   └── grad_by_time.py
├── obj/                # Arquivos objeto intermediários gerados pelo Make
├── README.md           # Documentação do projeto com instruções de uso
└── src/                # Códigos-fonte do projeto (.cpp)
    ├── default/        # Implementações base e classes genéricas
    │   ├── BaseClass.cpp
    │   ├── DerivedClass1.cpp
    │   ├── DerivedClass2.cpp
    │   ├── PolyDerived.cpp
    │   └── files.cpp
    ├── exact/          # Implementações de algoritmos exatos
    │   └── files.cpp
    ├── heuristic/      # Implementações de algoritmos heurísticos
    │   └── files.cpp
    └── main.cpp        # Ponto de entrada principal do programa

```

---

## 📌 Observações

- O projeto já vem com exemplos mínimos de uso para cada biblioteca.
- Pode ser usado como base para projetos mais complexos de otimização, análise de grafos e pesquisa operacional.
# default-opt-project
