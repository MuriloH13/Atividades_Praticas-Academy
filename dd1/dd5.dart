import 'dart:math';

void main() {
  gerarNome();
}

void gerarNome() {
  Random random = new Random();
  final listaNomes = [
    'Ana',
    'Francisco',
    'Joao',
    'Pedro',
    'Gabriel',
    'Rafaela',
    'Marcio',
    'Jose',
    'Carlos',
    'Patricia',
    'Helena',
    'Camila',
    'Mateus',
    'Gabriel',
    'Maria',
    'Samuel',
    'Karina',
    'Antonio',
    'Daniel',
    'Joel',
    'Cristiana',
    'Sebastião',
    'Paula',
  ];

  final listaSobrenomes = [
    'Silva',
    'Ferreira',
    'Almeida',
    'Azevedo',
    'Braga',
    'Barros',
    'Campos',
    'Cardoso',
    'Teixeira',
    'Costa',
    'Santos',
    'Rodrigues',
    'Souza',
    'Alves',
    'Pereira',
    'Lima',
    'Gomes',
    'Ribeiro',
    'Carvalho',
    'Lopes',
    'Barbosa',
  ];
  int posicao1 = random.nextInt(listaNomes.length);
  int posicao2 = random.nextInt(listaSobrenomes.length);
  String nome = listaNomes[posicao1];
  String sobrenome = listaSobrenomes[posicao2];

  print('Nome: $nome $sobrenome');
}
