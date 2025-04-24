void main() {
  converterNumeros();
}

void converterNumeros() {
  final listaNumeros = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];
  String binario = '';
  String octal = '';
  String hexadecimal = '';
  for (var numero in listaNumeros) {
    binario = numero.toRadixString(2);
    octal = numero.toRadixString(8);
    hexadecimal = numero.toRadixString(16);
    print(
      'Decimal: $numero, binário: $binario, octal: $octal, hexadecimal: $hexadecimal',
    );
  }
}
