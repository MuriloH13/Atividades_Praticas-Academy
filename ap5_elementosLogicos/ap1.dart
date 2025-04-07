void main(List<String> args) {
  if (args.isEmpty) {
    print('Informe um argumento válido');
  } else {
    final numeroMax = int.parse(args[0]);
    var numerosImpares = getNumerosImpares(numeroMax);

    for (var impares in numerosImpares) {
      print('Ímpar: $impares');
    }
  }
}

List<int> getNumerosImpares(int numero) {
  final lista = <int>[];
  int contador = 0;

  for (contador = 0; contador <= numero; contador++) {
    if (contador.isOdd) {
      lista.add(contador);
    }
  }
  return lista;
}
