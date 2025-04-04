List<int> removeElemento({List<int>? numeros, int? elementoOpc}) {
  numeros?.remove(elementoOpc);

  return numeros ?? [];
}

void main() {
  final listaNumeros = [0, 10, 20, 30, 40, 50, 60];
  final elemento = 0;

  final novaLista = removeElemento(
    numeros: listaNumeros,
    elementoOpc: elemento,
  );

  for (var item in novaLista) {
    print('Item: $item');
  }
}
