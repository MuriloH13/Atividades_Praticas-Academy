void main() {
  final paragrafo =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.';
  int tamanho = paragrafo.length;
  int palavras = contaPalavras(paragrafo, tamanho);
  int frases = contaFrases(paragrafo, tamanho);
  int vogais = contaVogais(paragrafo, tamanho);
  Set<String> consoantes = contaConsoantes(paragrafo, tamanho);

  print('parágrafo: $paragrafo');
  print('Número de palavras: $palavras');
  print('Tamanho do texto: $tamanho');
  print('Número de frases: $frases');
  print('Numero de vogais: $vogais');
  print('Consoantes encontradas: ${consoantes}');
}

int contaPalavras(String paragrafo, int tamanho) {
  int palavras = 1;
  for (var i = 0; i < tamanho; i++) {
    if (paragrafo[i].contains(' ')) {
      palavras++;
    }
  }
  return palavras;
}

int contaFrases(String paragrafo, int tamanho) {
  int frases = 0;
  for (var i = 0; i < tamanho; i++) {
    if (paragrafo[i].contains('.')) {
      frases++;
    }
  }
  return frases;
}

int contaVogais(String paragrafo, int tamanho) {
  int vogais = 0;
  for (var i = 0; i < tamanho; i++) {
    switch (paragrafo[i]) {
      case 'a':
      case 'e':
      case 'i':
      case 'o':
      case 'u':
        vogais++;
    }
  }
  return vogais;
}

Set<String> contaConsoantes(String paragrafo, int tamanho) {
  Set<String> consoantes = {};
  String alfabeto = 'bcdfghjklmnpqrstvwxyz';
  for (var i = 0; i < tamanho; i++) {
    if (alfabeto.contains(paragrafo[i])) {
      consoantes.add(paragrafo[i]);
    }
  }
  return consoantes;
}
