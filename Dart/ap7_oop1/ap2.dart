void main() {
  final largura = 20.0;
  final altura = 10.0;

  Retangulo retangulo = Retangulo(largura, altura);
  final area = retangulo.calcularArea(altura, largura);

  print('Area do retângulo: ${area.toStringAsFixed(9)}');
}

class Retangulo {
  Retangulo(this.largura, this.altura);

  final largura;
  final altura;

  double calcularArea(altura, largura) {
    double area = altura * largura;
    return area;
  }
}
