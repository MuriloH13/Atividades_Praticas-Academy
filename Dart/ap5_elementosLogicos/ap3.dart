import 'dart:math';

//Havia sido testado o código com argumentos de leitura.
void main(List<String> args) {
  final random = Random();

  final numeroAleatorio = random.nextInt(900) + 100;

  final somaAleatorio = somaPares(numeroAleatorio);
  print('A soma dos números pares entre 0 e $numeroAleatorio e $somaAleatorio');
}

int somaPares(int numero) {
  var indice = 0;
  var soma = 0;
  while (indice <= numero) {
    if (indice.isEven) {
      soma += indice;
    }
    indice++;
  }

  return soma;
}
