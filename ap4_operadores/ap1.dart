bool ehAnoBissexto(int ano) {
  if (ano % 100 == 0) {
    return (ano % 400) == 0;
  } else {
    return (ano % 4 == 0);
  }
}

void main() {
  final listaAnos = [2016, 1988, 2000, 2100, 2300, 1993];

  for (var indice in listaAnos) {
    print(ehAnoBissexto(indice)
        ? 'O ano $indice eh bissexto'
        : 'O ano $indice não eh bissexto');
  }
}
