void main() async {
  print('Iniciando lançamento');

  for (var contagem = 5; contagem > 0; contagem--) {
    await contagemRegressiva(contagem);
  }

  print('Foguete lançado!');
}

Future<void> contagemRegressiva(int contagem) async {
  print('$contagem');
  await Future.delayed(Duration(seconds: 1));
}
