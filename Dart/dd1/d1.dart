import 'dart:math';

void main() {
  final lista = [5, 8, 12, 7.3, 18, 2, 25];
  calcular(lista);
}

void calcular(List<num> lista) {
  for (var raio in lista) {
    final area = (pi * (raio * raio));
    final perimetro = (pi * (raio * 2));
    print(
      'Raio: $raio, area: ${area.toStringAsFixed(2)}, perímetro: ${perimetro.toStringAsFixed(2)}.',
    );
  }
}
