void main() async {
  await buscarDados();
}

Future<void> buscarDados() async {
  print('Iniciando busca!');
  await Future.delayed(Duration(seconds: 2));
  print('Buscando dados...');
  await Future.delayed(Duration(seconds: 5));
  print('Busca finalizada.');
}
