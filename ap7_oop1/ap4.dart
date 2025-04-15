import 'dart:math';

void main() {
  Random random = Random();

  final pessoa = Pessoa();

  pessoa.setNome = 'Murilo';
  pessoa.setIdade = random.nextInt(99) + 1;
  pessoa.setAltura = (random.nextDouble() * 1.3) + 1.0;

  print('''
Nome: ${pessoa.getNome}
Idade: ${pessoa.getIdade}
Altura: ${pessoa.getAltura.toStringAsFixed(2)}''');
}

class Pessoa {
  String _nome = '';
  int _idade = 0;
  double _altura = 0.0;

  set setNome(String nome) {
    this._nome = nome;
  }

  String get getNome {
    return this._nome;
  }

  set setIdade(int idade) {
    if (idade > 0) {
      this._idade = idade;
    }
  }

  int get getIdade {
    return this._idade;
  }

  set setAltura(double altura) {
    this._altura = altura;
  }

  double get getAltura {
    return this._altura;
  }
}
