void main(List<String> args) {
  numerosPares(int.parse(args[0]));
}

void numerosPares(int numero) {
  try {
    if (numero.isEven) {
      print('Entrada correta, você inseriu um número par.');
    } else {
      throw Exception('Entrada inválida. Insira apenas números pares.');
    }
  } catch (e) {
    print('$e');
  }
}
