
# Tratamento de Erros e Exceções em Dart

Este guia explica conceitos essenciais sobre tratamento de erros e exceções em Dart, com exemplos e boas práticas.

---

### ✅ Qual a diferença entre um erro e uma exceção em Dart?

- **Erro (`Error`)**: Indica problemas graves que geralmente não podem ser tratados em tempo de execução. Ex: `StackOverflowError`.
- **Exceção (`Exception`)**: Representa erros esperados e recuperáveis. Ex: `FormatException`.

```dart
void main() {
  throw FormatException("Formato inválido."); // Exceção
}
```

---

### 🧠 Em quais situações devo esperar encontrar um erro, e em quais devo esperar uma exceção?

- **Erro**: Bugs internos ou uso incorreto da linguagem. Ex: acessar um índice inexistente.
- **Exceção**: Situações externas esperadas, como falha de rede ou leitura de arquivo inválido.

---

### 🔐 O que fazem os blocos `try`, `catch` e `finally` em Dart?

- `try`: Bloco onde o código potencialmente problemático é executado.
- `catch`: Captura e trata exceções.
- `finally`: Sempre executado, com ou sem erro.

```dart
try {
  int.parse("abc");
} catch (e) {
  print("Erro: $e");
} finally {
  print("Finalizando...");
}
```

---

### 🧩 Como posso capturar diferentes tipos de exceções usando `catch`?

Use `on` para tipos específicos e `catch` para mensagens.

```dart
try {
  int.parse("abc");
} on FormatException catch (e) {
  print("Erro de formato: $e");
} catch (e) {
  print("Erro genérico: $e");
}
```

---

### 🔄 Em quais situações é útil usar o bloco `finally`?

- Liberar recursos (ex: fechar arquivos ou conexões).
- Garantir execução de código, independentemente do sucesso.

```dart
File file = File("dados.txt");
try {
  file.readAsStringSync();
} finally {
  file.deleteSync();
}
```

---

### 🚨 Por que eu precisaria lançar uma exceção em meu código?

- Para alertar sobre situações inesperadas ou inválidas que não podem ser ignoradas.

```dart
void dividir(int a, int b) {
  if (b == 0) {
    throw Exception("Divisão por zero não permitida.");
  }
}
```

---

### ✍️ Como posso personalizar mensagens de erro ao lançar exceções?

- Inclua mensagens claras e informativas:

```dart
throw FormatException("Esperado número, recebido texto.");
```

---

### 📌 Quais são as melhores práticas para lançar exceções em Dart?

- Lance exceções apenas quando necessário.
- Use tipos de exceções adequados.
- Forneça mensagens claras.
- Não capture exceções genéricas sem tratá-las corretamente.

---

### 🧪 Qual a diferença entre usar `assert` e lançar uma exceção para verificar condições?

- `assert`: Verificação usada apenas em **modo de desenvolvimento**.
- `throw`: Sempre executado, inclusive em produção.

```dart
void validarIdade(int idade) {
  assert(idade >= 0); // apenas no modo debug
  if (idade < 0) throw Exception("Idade inválida!");
}
```

---

### 🛠️ Em quais situações o `assert` é mais útil durante o desenvolvimento?

- Testes internos e validações durante o desenvolvimento.
- Contratos de método (pré-condições).

```dart
void processarDados(String nome) {
  assert(nome.isNotEmpty);
  print("Processando $nome...");
}
```

---

### 👍 Dica Final

Use exceções para tornar seu código mais seguro, robusto e fácil de depurar. Combine `try/catch` com boas mensagens e tipos específicos sempre que possível.
