import 'dart:math';

int funcaoA(int Function(int) operacao) {
  Random random = Random();

  int num1 = random.nextInt(100);
  int num2 = random.nextInt(100);

  print("Número 1: $num1");
  print("Número 2: $num2");

  int resultado1 = operacao(num1);
  int resultado2 = operacao(num2);

  print("Resultado 1: $resultado1");
  print("Resultado 2: $resultado2");

  return resultado1 + resultado2;
}

int funcaoB(int num) {
  return num * 2;
}

int funcaoC(int num) {
  return num * num;
}

void main() {
  print("Executando função A com B:");
  int resultadoB = funcaoA(funcaoB);
  print("Soma dos resultados: $resultadoB\n");

  print("Executando função A com C:");
  int resultadoC = funcaoA(funcaoC);
  print("Soma dos resultados: $resultadoC");
}
