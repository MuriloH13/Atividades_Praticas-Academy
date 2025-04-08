void main(List<String> args) {
  passToString(args[0]);
}

void passToString(String numero) {
  try {
    int.parse(numero);
    print('Numero digitado: $numero');
  } catch (e) {
    print("Entrada invalida. Insira apenas números inteiros.");
  }
}
