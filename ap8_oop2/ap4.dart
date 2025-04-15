import 'dart:math';

void main() {
  Random random = Random();
  final numero = random.nextInt(2000);
  final numeroDobrado = Calculadora.dobro(numero);
  print('O dobro do número $numero e: $numeroDobrado');
}

abstract class Calculadora {
  static int dobro(int numero) {
    return numero * 2;
  }
}
