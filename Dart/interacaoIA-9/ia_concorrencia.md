# Concorrência e Assincronismo com Future em Dart

## • O que é um Future em Dart e como ele me ajuda a lidar com tarefas que levam tempo?
Um `Future` representa o resultado de uma operação que pode não ter sido concluída ainda. Ele é usado para tarefas assíncronas, como chamadas HTTP, leitura de arquivos ou delays. Com `Future`, você pode continuar executando outras partes do código enquanto espera pelo resultado.

**Exemplo:**
```dart
Future<String> buscarDados() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Dados carregados';
}
```

## • O que significam os termos 'assíncrono' e 'síncrono'?
- **Síncrono:** O código é executado linha por linha, esperando cada operação terminar antes de passar para a próxima.
- **Assíncrono:** Permite que certas operações ocorram em segundo plano, liberando o fluxo principal para continuar executando outras tarefas.

## • O que acontece se um Future falhar e como posso lidar com esse erro?
Se um `Future` falha, ele lança uma exceção. Você pode capturar e tratar esse erro com `try/catch` ou com o método `catchError`.

**Exemplo:**
```dart
Future<void> carregarDados() async {
  try {
    var resultado = await buscarDados();
    print(resultado);
  } catch (e) {
    print('Erro ao carregar dados: $e');
  }
}
```

## • Existe uma forma de executar várias tarefas assíncronas em paralelo?
Sim! Você pode usar `Future.wait()` para aguardar múltiplos `Futures` simultaneamente.

**Exemplo:**
```dart
Future<void> carregarTudo() async {
  var resultados = await Future.wait([
    buscarDados(),
    Future.delayed(Duration(seconds: 1), () => 'Outro dado')
  ]);
  print(resultados);
}
```

## • Em quais situações devo usar Futures em meu código Dart?
Use `Futures` quando:
- For necessário aguardar o resultado de uma operação demorada;
- Estiver trabalhando com I/O (como APIs, arquivos ou banco de dados);
- Desejar melhorar a performance executando tarefas simultaneamente.

## • Quais cuidados devo tomar não usando await em funções Future?
Se você esquecer de usar `await`, a função retorna um `Future` em vez do valor real, o que pode causar erros ou comportamentos inesperados.

**Exemplo:**
```dart
void main() {
  var resultado = buscarDados(); // Retorna Future<String>, não a string!
  print(resultado);
}
```

## • Como lidar com erros usando Future?
Você pode usar:
- `try/catch` com `async/await`;
- O método `.catchError()` encadeado ao `Future`.

**Exemplo usando .catchError():**
```dart
buscarDados()
  .then((valor) => print(valor))
  .catchError((erro) => print('Erro: $erro'));
```

---

Dica: Use `async/await` sempre que possível para deixar o código mais legível e parecido com código síncrono tradicional.