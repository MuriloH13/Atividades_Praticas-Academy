import 'dart:math';

//Utilizando List<T> args para praticar o conceito.
void main(List<String> args) {
  if (args.isEmpty) {
    print('Informe um argumento válido!');
  } else {
    //Converte o argumento para int para poder ser utilizado como parâmetro na função.
    final numero = int.parse(args[0]);
    final random = Random();

    for (var indice = 1; indice <= 6; indice++) {
      if (indice == 1) {
        final letra = getLetraAlfabeto(numero);
        print('Número ${numero + 1} -> Letra $letra');
      } else {
        final numerosAleatorios = random.nextInt(25) + 1;
        final letra = getLetraAlfabeto(numerosAleatorios);
        print('Número ${numerosAleatorios + 1} -> Letra $letra');
      }
    }
  }
}

String getLetraAlfabeto(int numero) {
  String letra = String.fromCharCode(65 + numero);

  return letra;
}
