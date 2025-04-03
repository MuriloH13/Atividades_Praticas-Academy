import 'dart:math';

String converterBinario(int numero) {
  return numero.toRadixString(2);
}

String converterOctal(int numero) {
  return numero.toRadixString(8);
}

String converterHexadecimal(int numero) {
  return numero.toRadixString(16);
}

void main() {
  List<int> numeros = List.generate(15, (_) => Random().nextInt(5000) + 1);

  numeros.sort();

  for (int numero in numeros) {
    print(
        "Decimal: $numero, Binário: ${converterBinario(numero)}, Octal: ${converterOctal(numero)}, Hexadecimal: ${converterHexadecimal(numero)}");
  }
}
