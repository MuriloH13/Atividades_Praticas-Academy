import 'dart:math';

void main() {
  Random random = Random();

  final generos = GenerosMusicais.values;

  final generoFavorito = generos[random.nextInt(generos.length)];

  switch (generoFavorito) {
    case GenerosMusicais.pagode:
      print('Meu gênero musical preferido e o pagode');
      break;
    case GenerosMusicais.rap:
      print('Meu gênero musical preferido e o rap');
      break;
    case GenerosMusicais.rock:
      print('Meu gênero musical preferido e o rock');
      break;
    case GenerosMusicais.trap:
      print('Meu gênero musical preferido e o trap');
      break;
  }
}

enum GenerosMusicais { pagode, trap, rap, rock }
