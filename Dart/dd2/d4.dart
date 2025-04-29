import 'dart:math' as math;

void main() {
  final comparador = ComparadorFormasGeometricas();

  final formas = <FormaGeometrica>[
    Circulo('Circulo A', 3),
    Circulo('Circulo B', 8),
    Retangulo('Retângulo A', 4, 3),
    Retangulo('Retângulo B', 19, 11),
    TrianguloEquilatero('Triângulo Equilátero', 6),
    TrianguloRetangulo('Triângulo Retângulo', 3, 4),
    PentagonoRegular('Pentágono Regular', 5),
    HexagonoRegular('Hexágono Regular', 5),
  ];

  final maiorArea = comparador.maiorArea(formas);
  final maiorPerimetro = comparador.maiorPerimetro(formas);

  print(
    'A maior área é ${maiorArea.area.toStringAsFixed(2)} e pertence a ${maiorArea.nome}',
  );
  print(
    'O maior perímetro é ${maiorPerimetro.perimetro.toStringAsFixed(2)} e pertence a ${maiorPerimetro.nome}',
  );
}

// =================== HERANÇA E POLIMORFISMO ===================
abstract class FormaGeometrica {
  final String nome;
  FormaGeometrica(this.nome);

  double get area;
  double get perimetro;
}

class Circulo extends FormaGeometrica {
  final double raio;
  Circulo(String nome, this.raio) : super(nome);

  @override
  double get area => math.pi * math.pow(raio, 2);

  @override
  double get perimetro => 2 * math.pi * raio;
}

class Retangulo extends FormaGeometrica {
  final double altura;
  final double largura;
  Retangulo(String nome, this.altura, this.largura) : super(nome);

  @override
  double get area => altura * largura;

  @override
  double get perimetro => 2 * (altura + largura);
}

class Quadrado extends FormaGeometrica {
  final double lado;
  Quadrado(String nome, this.lado) : super(nome);

  @override
  double get area => lado * lado;

  @override
  double get perimetro => 4 * lado;
}

class TrianguloEquilatero extends FormaGeometrica {
  final double lado;
  TrianguloEquilatero(String nome, this.lado) : super(nome);

  @override
  double get area => (math.sqrt(3) / 4) * math.pow(lado, 2);

  @override
  double get perimetro => 3 * lado;
}

class TrianguloRetangulo extends FormaGeometrica {
  final double base;
  final double altura;
  TrianguloRetangulo(String nome, this.base, this.altura) : super(nome);

  @override
  double get area => (base * altura) / 2;

  @override
  double get perimetro =>
      base + altura + math.sqrt(math.pow(base, 2) + math.pow(altura, 2));
}

class PentagonoRegular extends FormaGeometrica {
  final double lado;
  PentagonoRegular(String nome, this.lado) : super(nome);

  @override
  double get area => (5 * math.pow(lado, 2)) / (4 * math.tan(math.pi / 5));

  @override
  double get perimetro => 5 * lado;
}

class HexagonoRegular extends FormaGeometrica {
  final double lado;
  HexagonoRegular(String nome, this.lado) : super(nome);

  @override
  double get area => ((3 * math.sqrt(3)) / 2) * math.pow(lado, 2);

  @override
  double get perimetro => 6 * lado;
}

// =================== COMPARADOR COM POLIMORFISMO ===================
class ComparadorFormasGeometricas {
  FormaGeometrica maiorArea(List<FormaGeometrica> formas) {
    return formas.reduce((a, b) => a.area >= b.area ? a : b);
  }

  FormaGeometrica maiorPerimetro(List<FormaGeometrica> formas) {
    return formas.reduce((a, b) => a.perimetro >= b.perimetro ? a : b);
  }
}
