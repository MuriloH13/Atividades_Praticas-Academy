# Guia de Operadores e Estruturas de Controle em Flutter

## O que acontece se eu comparar valores de tipos diferentes usando operadores relacionais em Dart?

Se você comparar valores de tipos diferentes usando operadores relacionais (`>`, `<`, `>=`, `<=`), o Dart lançará um erro em tempo de execução, pois esses operadores só podem ser usados em valores do mesmo tipo ou tipos compatíveis.

```dart
void main() {
  print(10 > "5"); // Erro: não é possível comparar um int com uma String
}
```

## Qual a diferença entre os operadores de divisão '/' e '~/`?

- `/` (Divisão padrão) retorna um valor do tipo `double`, mesmo que o resultado seja um número inteiro.
- `~/` (Divisão inteira) retorna um valor do tipo `int`, descartando a parte decimal.

```dart
void main() {
  print(10 / 3);  // Saída: 3.3333333333333335
  print(10 ~/ 3); // Saída: 3
}
```

## Como verifico se uma variável é de um determinado tipo em Dart?

Para verificar se uma variável pertence a um determinado tipo, usamos o operador `is`.

```dart
void main() {
  var valor = "Texto";
  print(valor is String); // true
  print(valor is int);    // false
}
```

## Qual a função do operador '?' em testes de tipo?

O operador `?` em testes de tipo permite que uma variável tenha um valor nulo (`null`). Ele é usado em declarações de variáveis opcionais.

```dart
String? nome;
print(nome?.length); // Evita erro caso nome seja null
```

## Quando usar os operadores de valores opcionais e valores requeridos em uma função Dart?

- **Valores opcionais** (`[param]`) são usados quando um parâmetro pode ser omitido.
- **Valores requeridos** (`{required param}`) garantem que um parâmetro deve ser fornecido ao chamar a função.

```dart
void saudacao(String nome, {String? mensagem = "Olá"}) {
  print("$mensagem, $nome!");
}

void main() {
  saudacao("Alice");            // Olá, Alice!
  saudacao("Bob", mensagem: "Oi"); // Oi, Bob!
}
```

## Quais são os operadores de atribuição compostos e como eles funcionam?

Os operadores de atribuição compostos combinam uma operação matemática com a atribuição:

- `+=`: Adição e atribuição
- `-=`: Subtração e atribuição
- `*=`: Multiplicação e atribuição
- `/=`: Divisão e atribuição
- `~/=`: Divisão inteira e atribuição

```dart
void main() {
  int a = 5;
  a += 3; // Equivalente a: a = a + 3;
  print(a); // Saída: 8
}
```

## Como uso os operadores '&&' e '||' para combinar condições?

- `&&` (E lógico): Retorna `true` se ambas as condições forem verdadeiras.
- `||` (OU lógico): Retorna `true` se pelo menos uma das condições for verdadeira.

```dart
void main() {
  int idade = 20;
  bool temCarteira = true;

  if (idade >= 18 && temCarteira) {
    print("Pode dirigir");
  }

  if (idade < 18 || !temCarteira) {
    print("Não pode dirigir");
  }
}
```

## Qual a diferença entre usar 'if-else' e expressões condicionais?

- `if-else` é usado para estruturação mais tradicional do código.
- Expressões condicionais (`condicao ? valor1 : valor2`) são mais curtas e úteis para atribuições rápidas.

```dart
void main() {
  int idade = 20;
  String mensagem = (idade >= 18) ? "Maior de idade" : "Menor de idade";
  print(mensagem);
}
```

## Em quais situações a notação em cascata pode tornar o código mais legível?

A notação em cascata (`..`) permite encadear chamadas de métodos em um mesmo objeto, tornando o código mais fluido e legível.

```dart
class Pessoa {
  String? nome;
  int? idade;
  void apresentar() {
    print("Nome: $nome, Idade: $idade");
  }
}

void main() {
  Pessoa p = Pessoa()
    ..nome = "Alice"
    ..idade = 25
    ..apresentar();
}
```

## Qual a diferença entre usar a notação em cascata e chamar métodos separadamente?

A notação em cascata (`..`) mantém a referência ao mesmo objeto, enquanto chamadas separadas exigem atribuições explícitas.

**Sem cascata:**

```dart
Pessoa p = Pessoa();
p.nome = "Alice";
p.idade = 25;
p.apresentar();
```

**Com cascata:**

```dart
Pessoa p = Pessoa()
  ..nome = "Alice"
  ..idade = 25
  ..apresentar();
```

## Como a notação em cascata pode ser usada para modificar um objeto após realizar testes de tipo?

Podemos combinar a notação em cascata com `is` para modificar um objeto após verificar seu tipo:

```dart
void main() {
  dynamic obj = Pessoa();

  if (obj is Pessoa) {
    obj
      ..nome = "Carlos"
      ..idade = 30
      ..apresentar();
  }
}
```

---