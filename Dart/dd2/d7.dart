import 'dart:collection';
import 'dart:math';

void main() {
  final filaMercado = FilaMercado();

  for (var i = 0; i < 10; i++) {
    final nome = GeradorDeNomes.gerarNomeAleatorio();
    filaMercado.entrarNaFila(nome);
  }

  while (filaMercado.temPessoasNaFila) {
    filaMercado.atenderPessoa();
  }
}

class FilaMercado {
  final Queue<String> _fila = Queue<String>();

  void entrarNaFila(String nome) {
    _fila.addLast(nome);
    print('* $nome entrou na fila');
  }

  void atenderPessoa() {
    final nome = _fila.removeFirst();
    print('* $nome foi atendido(a)');
  }

  bool get temPessoasNaFila => _fila.isNotEmpty;
}

class GeradorDeNomes {
  static final _random = Random();

  static final _nomes = [
    'Ana',
    'Lucas',
    'Mariana',
    'Pedro',
    'Carla',
    'João',
    'Fernanda',
    'Rafael',
    'Laura',
    'Gabriel',
  ];

  static final _sobrenomes = [
    'Silva',
    'Souza',
    'Oliveira',
    'Lima',
    'Costa',
    'Pereira',
    'Ferreira',
    'Almeida',
    'Rodrigues',
    'Martins',
  ];

  static String gerarNomeAleatorio() {
    final nome = _nomes[_random.nextInt(_nomes.length)];
    final sobrenome = _sobrenomes[_random.nextInt(_sobrenomes.length)];
    return '$nome $sobrenome';
  }
}
