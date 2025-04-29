import 'dart:math';

double calcularArea(double raio) {
  return pi * pow(raio, 2);
}

double calcularPerimetro(double raio) {
  return 2 * pi * raio;
}

void main() {
  List<double> raios =
      List.generate(10, (_) => Random().nextInt(100) + 1.toDouble());

  for (double raio in raios) {
    double area = calcularArea(raio);
    double perimetro = calcularPerimetro(raio);

    print(
        "Raio: ${raio.toStringAsFixed(2)}, Área: ${area.toStringAsFixed(2)}, Perímetro: ${perimetro.toStringAsFixed(2)}");
  }
}
