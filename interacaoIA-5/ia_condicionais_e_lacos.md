# 📘 Estruturas de Controle em Dart

---

## ✅ Qual a diferença entre usar `if`, `else if` e `else`?

- `if`: executa um bloco de código se a condição for verdadeira.
- `else if`: usado para testar uma nova condição se a anterior foi falsa.
- `else`: executa um bloco caso nenhuma das condições anteriores seja verdadeira.

```dart
int idade = 18;

if (idade < 18) {
  print("Menor de idade");
} else if (idade == 18) {
  print("Tem exatamente 18 anos");
} else {
  print("Maior de idade");
}
```

---

## ⚠️ Quais cuidados tenho que ter com `if` e `else`?

- Sempre garantir que há uma condição válida no `if`.
- Cuidado com chaves `{}`: não omitir em blocos com múltiplas instruções.
- Evite muitos `else if` seguidos – considere `switch` ou mapeamentos.
- Evite condições muito complexas em uma única linha.

---

## 🧭 Qual a importância da palavra-chave `break` em um `switch case`?

O `break` encerra o `case` atual e evita que os próximos sejam executados ("fall-through").

```dart
var dia = "segunda";

switch (dia) {
  case "segunda":
    print("Início da semana");
    break;
  case "sexta":
    print("Final da semana");
    break;
  default:
    print("Outro dia");
}
```

---

## 🔄 Quando devo usar `switch` em vez de uma série de `if else`?

Use `switch` quando estiver lidando com múltiplos valores possíveis de uma mesma variável. Fica mais organizado e legível do que muitos `if else`.

---

## 🔢 Qual a diferença entre um loop `for` tradicional e um loop `for...in`?

- `for`: ideal quando se precisa de índice ou controlar a quantidade de repetições.
- `for...in`: ideal para iterar diretamente sobre elementos de uma lista.

```dart
// for tradicional
for (int i = 0; i < 5; i++) {
  print("Contagem: $i");
}

// for...in
List<String> frutas = ["Maçã", "Banana", "Uva"];
for (var fruta in frutas) {
  print(fruta);
}
```

---

## 🔁 Como posso repetir um bloco de código um número específico de vezes?

Usando o `for`:

```dart
for (int i = 0; i < 10; i++) {
  print("Repetição $i");
}
```

---

## ⚠️ Quais são os riscos de usar um loop `while` sem uma condição de parada adequada?

Pode causar **loop infinito**, travando o programa. Sempre assegure que a condição será falsa em algum momento.

```dart
int i = 0;
while (i < 5) {
  print(i);
  i++; // Sem isso, loop infinito
}
```

---

## ⏳ Quando é adequado usar `for` e usar `while`?

- Use `for` quando souber quantas vezes o loop deve ocorrer.
- Use `while` quando a condição de parada depende de algo que muda durante a execução.

---

## 🆚 Qual a diferença entre os comandos `break` e `continue`?

- `break`: encerra completamente o loop.
- `continue`: pula para a próxima iteração do loop.

```dart
// continue
for (int i = 0; i < 5; i++) {
  if (i == 2) continue;
  print(i);
}

// break
for (int i = 0; i < 5; i++) {
  if (i == 2) break;
  print(i);
}
```

---

## 🔁 Como posso usar `break` para sair de um loop aninhado?

Use um `label` para indicar de qual loop sair.

```dart
outerLoop:
for (int i = 0; i < 3; i++) {
  for (int j = 0; j < 3; j++) {
    if (j == 1) break outerLoop;
    print("i=$i, j=$j");
  }
}
```

---

## ➿ Em quais situações é útil usar o comando `continue` em um loop?

Quando você deseja **ignorar a execução do restante do loop** naquela iteração específica.

Exemplo: pular números pares.

```dart
for (int i = 0; i < 10; i++) {
  if (i % 2 == 0) continue;
  print(i); // Só imprime ímpares
}
```

---