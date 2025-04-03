import 'dart:math';

void main() {
  List<int> lista1 = List.generate(5, (_) => Random().nextInt(100));
  List<int> lista2 = List.generate(5, (_) => Random().nextInt(100));

  imprimirLista(lista1);
  imprimirLista(lista2);

  List<int> listaFinal = somarListas(lista1, lista2);

  imprimirLista(listaFinal);
}

void imprimirLista(List<int> lista) {
  if (lista.isEmpty) {
    print("Lista vazia");
  } else {
    print("Lista: ${lista.join(', ')}");
  }
}

List<int> somarListas(List<int> lista1, List<int> lista2) {
  if (lista1.length != lista2.length) {
    print("As listas têm tamanhos diferentes. Retornando lista vazia.");
    return [];
  }

  List<int> resultado = [];
  for (int indice = 0; indice < lista1.length; indice++) {
    int soma = lista1[indice] + lista2[indice];
    print("${lista1[indice]} + ${lista2[indice]}");
    resultado.add(soma);
  }

  return resultado;
}
