
# Conceitos Avançados de Orientação a Objetos em Dart

Este documento responde a perguntas comuns sobre orientação a objetos em Dart, com exemplos e dicas úteis.

---

### • O que significa 'sobrescrever' um método em Dart e por que eu faria isso?
**Sobrescrever** (override) significa reescrever um método herdado de uma superclasse para fornecer uma implementação personalizada.

```dart
class Animal {
  void fazerSom() => print("Algum som");
}

class Cachorro extends Animal {
  @override
  void fazerSom() => print("Latido");
}
```

Usamos isso para especializar comportamentos em subclasses.

---

### • Como posso chamar o método original de uma classe pai em um método sobrescrito?
Use a palavra-chave `super`:

```dart
@override
void fazerSom() {
  super.fazerSom();
  print("Latido adicional");
}
```

---

### • Como posso criar um getter para acessar um atributo privado de uma classe?
```dart
class Pessoa {
  final String _nome;

  Pessoa(this._nome);

  String get nome => _nome;
}
```

---

### • Em quais situações é melhor usar getters e setters em vez de acessar atributos diretamente?
- Quando precisa validar ou modificar o valor antes de acessar/alterar.
- Para encapsular a lógica de acesso.
- Para manter a flexibilidade futura sem mudar a API.

---

### • O que é uma 'classe abstrata' e como ela difere de uma classe normal?
Uma classe **abstrata** não pode ser instanciada diretamente. Serve como base para outras classes.

```dart
abstract class Animal {
  void fazerSom(); // método sem implementação
}
```

---

### • Quando devo usar classes abstratas em vez de classes concretas?
- Quando quer forçar subclasses a implementar certos métodos.
- Para definir um contrato comum entre múltiplas subclasses.

---

### • O que é 'herança' em Dart e como ela funciona?
**Herança** permite que uma classe (filha) herde atributos e métodos de outra (pai).

```dart
class Animal {
  void andar() => print("Andando");
}

class Gato extends Animal {}
```

---

### • Qual a diferença entre herança e composição?
- **Herança**: "é um" (ex: Gato é um Animal).
- **Composição**: "tem um" (ex: Carro tem um Motor).

```dart
class Motor {}

class Carro {
  Motor motor = Motor();
}
```

---

### • O que é uma 'interface' em Dart e como ela define um contrato de comportamento?
Em Dart, **qualquer classe pode ser usada como interface**. Uma interface define métodos que devem ser implementados.

---

### • Como uma classe pode implementar uma interface?
```dart
class Animal {
  void fazerSom() {}
}

class Cachorro implements Animal {
  @override
  void fazerSom() => print("Au au!");
}
```

---

### • Qual a diferença entre herança e implementação de interfaces?
- **Herança**: você herda código.
- **Interface**: você apenas se compromete a implementar os métodos.

---

### • Quais cenários devo usar métodos estáticos em vez de métodos de instância?
- Quando o comportamento **não depende de uma instância** da classe.
- Para utilitários ou funções auxiliares.

```dart
class Utils {
  static double converterParaKm(double milhas) => milhas * 1.60934;
}
```

---

### • Como posso acessar um método estático sem criar uma instância da classe?
```dart
Utils.converterParaKm(10);
```

---

### • O que são 'enumeradores' em Dart e para que servem?
**Enums** são tipos especiais usados para representar um conjunto fixo de valores.

```dart
enum Status { carregando, completo, erro }
```

---

### • Em quais situações é melhor usar enumeradores em vez de constantes?
- Quando os valores representam **opções limitadas e conhecidas**.
- Para maior segurança de tipo e legibilidade de código.

---
