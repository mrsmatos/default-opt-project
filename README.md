
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
├── src/                # Códigos-fonte (.cpp)
├── include/            # Cabeçalhos e typedefs
├── obj/                # Objetos compilados (Make)
├── build/              # Diretório de build (CMake)
├── Makefile            # Build manual
├── CMakeLists.txt      # Build via CMake
└── test_program        # Executável final
```

---

## 📌 Observações

- O projeto já vem com exemplos mínimos de uso para cada biblioteca.
- Pode ser usado como base para projetos mais complexos de otimização, análise de grafos e pesquisa operacional.
# default-opt-project
