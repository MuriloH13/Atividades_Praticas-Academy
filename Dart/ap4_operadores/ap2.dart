List<int> converterInt(List<String> texts) {
  final lista = <int>[];

  for (var texto in texts) {
    int? numeros = int.tryParse(texto);

    numeros ??= 0;

    lista.add(numeros);
  }
  return lista;
}

void main() {
  final lista = [
    '10',
    '2XXL7',
    'JOJ0',
    '99',
    '381',
    'AD44',
    '47',
    '2B',
    '123',
    '78'
  ];

  final numeros = converterInt(lista);
  print('Lista convertida ${numeros.join(', ')}');
}
