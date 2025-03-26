import 'dart:math';

void main() {
  final random1 = Random().nextInt(100),
      random2 = Random().nextInt(100),
      resultado = random1 / random2;

  final int resultadoInteiro = resultado.toInt();
  final double resultadoDecimal = resultado - resultadoInteiro;

  print("""$random1 / $random2 = $resultado \n
        Parte inteira: $resultadoInteiro \n
        Parte decimal: $resultadoDecimal""");
}
