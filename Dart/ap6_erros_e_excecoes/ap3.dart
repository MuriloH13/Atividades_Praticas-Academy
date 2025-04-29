import 'dart:math';

void main(List<String> args) {
  final random = Random();

  try {
    final retangulo =
        Retangulo(random.nextDouble() * 99, random.nextDouble() * 99);
    double area = retangulo.calcularArea();
    print('Area do retângulo: ${area.toStringAsFixed(2)}');
  } on Exception catch (e) {
    print(e);
  }
}

abstract class Forma {
  double calcularArea();
}

class Retangulo implements Forma {
  Retangulo(this.base, this.altura) {
    if (base <= 0 || altura <= 0) {
      throw Exception(
        'Dimensões inválidas, informe apenas valores positivos maiores que zero',
      );
    }
  }

  final double base;
  final double altura;

  @override
  double calcularArea() {
    return base * altura;
  }
}
