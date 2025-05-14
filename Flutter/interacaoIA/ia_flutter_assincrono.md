# 📘 InteraçãoIA-Flutter – Programação Assíncrona, Future, HTTP e JSON

---

## 🔄 O que é programação assíncrona em Flutter e por que ela é importante?

A programação assíncrona permite que tarefas demoradas, como requisições HTTP ou leitura de arquivos, sejam executadas sem bloquear a interface do usuário. Isso garante uma experiência fluida e responsiva para o usuário.

---

## ⚠️ Quais cuidados devo ter usando programação assíncrona?

* **Tratar erros com `try-catch`**
* **Evitar acessar o contexto após um `await` sem verificar se o widget ainda está montado**
* **Manter o código organizado, especialmente quando se lida com várias chamadas assíncronas**

---

## 🧵 O que são isolates em Flutter?

Isolates são unidades de execução paralelas no Dart. Diferente de threads, eles não compartilham memória e se comunicam por mensagens. São úteis para tarefas pesadas, como compressão ou parsing de grandes arquivos.

---

## ⚙️ Quais cuidados devo ter ao usar isolates em Flutter?

* Use a função `compute()` sempre que possível.
* Evite tarefas simples em isolates, pois criá-los tem um custo de performance.
* Planeje bem a comunicação entre isolates para evitar bugs.

---

## 🔁 Qual o conceito do Loop de Eventos em Flutter?

O Event Loop é responsável por gerenciar a fila de eventos e callbacks. Ele executa as operações assíncronas conforme vão sendo completadas, mantendo o app responsivo.

---

## ⏳ O que é um 'Future' em Dart e como ele funciona?

Um `Future` representa um valor que estará disponível no futuro. Ele pode estar nos estados: **incompleto**, **completo com sucesso** ou **completo com erro**.

---

## 🔧 Como posso usar 'async' e 'await' para trabalhar com 'Futures'?

```dart
Future<void> buscarDados() async {
  final resposta = await http.get(Uri.parse('https://api.exemplo.com'));
  print(resposta.body);
}
```

---

## 🛠️ Como posso lidar com erros em operações assíncronas usando 'try-catch'?

```dart
try {
  final response = await http.get(Uri.parse('https://api.exemplo.com'));
  print(response.body);
} catch (e) {
  print('Erro: \$e');
}
```

---

## 🌐 Explicação dos métodos HTTP

* **GET**: busca dados do servidor.
* **POST**: envia dados para o servidor.
* **PUT**: atualiza dados existentes.
* **DELETE**: remove dados.
* **PATCH**: atualiza parcialmente dados.

---

## 📡 Como posso lidar com diferentes códigos de resposta HTTP (200, 404, 500)?

```dart
if (response.statusCode == 200) {
  // sucesso
} else if (response.statusCode == 404) {
  // não encontrado
} else if (response.statusCode == 500) {
  // erro no servidor
}
```

---

## 🧾 O que é JSON e como ele é usado em Flutter?

JSON (JavaScript Object Notation) é um formato leve de troca de dados. No Flutter, usamos a biblioteca `dart:convert` para convertê-lo para objetos Dart.

---

## 🔍 Como posso acessar valores específicos em um objeto JSON?

```dart
final dados = jsonDecode(response.body);
print(dados['nome']);
```

---

## 📋 Como posso lidar com arrays (listas) em JSON em Flutter?

```dart
final List<dynamic> lista = jsonDecode(response.body);
```

---

## ↻ Como posso iterar sobre os elementos de um array JSON?

```dart
for (var item in lista) {
  print(item['nome']);
}
```

---

## 🧱 Por que é últil mapear JSON para classes Dart?

* Facilita o uso de dados com tipagem forte.
* Melhora a legibilidade.
* Organiza melhor o código.

---

## 🏠 Como posso usar 'factory' para criar objetos Dart a partir de JSON?

```dart
class Usuario {
  final String nome;
  Usuario({required this.nome});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(nome: json['nome']);
  }
}
```

---

## 🧪 Como posso usar 'toJson()' para converter objetos Dart em JSON?

```dart
class Usuario {
  final String nome;
  Usuario({required this.nome});

  Map<String, dynamic> toJson() => {'nome': nome};
}
```

---

## 📁 Como organizar minhas requisições no meu código Flutter?

Crie uma camada de serviços:

```dart
class ApiService {
  Future<Usuario> buscarUsuario() async {
    final response = await http.get(Uri.parse('https://api.exemplo.com/usuario'));
    final json = jsonDecode(response.body);
    return Usuario.fromJson(json);
  }
}
```

---
