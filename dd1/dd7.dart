void main() {
  final lista = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];
  forSomatorio(lista);
  whileSomatorio(lista);
  int recursao = recursaoSomatorio(lista);
  int colecao = colecaoSomatorio(lista);
  print('recursão: $recursao');
  print('lista: $colecao');
}

void forSomatorio(List<int> lista) {
  int soma = 0;
  for (var numero in lista) {
    soma += numero;
  }
  print('for: $soma');
}

void whileSomatorio(List<int> lista) {
  int soma = 0;
  int contador = 0;
  while (contador < lista.length) {
    soma += lista[contador];
    contador++;
  }
  print('while: $soma');
}

int recursaoSomatorio(List<int> lista) {
  if (lista.isEmpty) {
    return 0;
  } else {
    return lista.first + recursaoSomatorio(lista.sublist(1));
  }
}

int colecaoSomatorio(List<int> lista) {
  return lista.fold(0, (soma, elemento) => soma + elemento);
}
