import 'dart:collection';
import 'dart:math';

void main() {
  final todasAsFiguras = List<Figura>.generate(
    20,
    (i) => Figura(codigo: i + 1, nome: 'Figura ${i + 1}'),
  );

  final album = Album(todasAsFiguras);
  final List<Figura> repetidas = [];

  while (!album.estaCompleto()) {
    final pacote = PacoteFiguras.gerarPacote(todasAsFiguras);
    for (var figura in pacote.figuras) {
      final inseriu = album.adicionarFigura(figura);
      if (!inseriu) {
        repetidas.add(figura);
      }
    }
  }

  print('\nNúmero de figuras repetidas: ${repetidas.length}\n');
  print('Figuras coladas no álbum:');
  album.imprimirAlbum();
}

/// Classe que representa uma figura com nome e código único
class Figura {
  final int codigo;
  final String nome;

  Figura({required this.codigo, required this.nome});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Figura &&
          runtimeType == other.runtimeType &&
          codigo == other.codigo;

  @override
  int get hashCode => codigo.hashCode;

  @override
  String toString() => '$codigo - $nome';
}

/// Classe que representa um pacote de 4 figuras aleatórias
class PacoteFiguras {
  final List<Figura> figuras;

  PacoteFiguras._(this.figuras);

  static final _random = Random();

  static PacoteFiguras gerarPacote(List<Figura> todasFiguras) {
    final figurasDoPacote = <Figura>[];
    for (var i = 0; i < 4; i++) {
      figurasDoPacote.add(todasFiguras[_random.nextInt(todasFiguras.length)]);
    }
    return PacoteFiguras._(figurasDoPacote);
  }
}

/// Classe que representa o álbum
class Album {
  final Set<Figura> _figurasColadas = SplayTreeSet<Figura>(
    (a, b) => a.codigo.compareTo(b.codigo),
  );
  final List<Figura> _todasFiguras;

  Album(this._todasFiguras);

  /// Adiciona uma figura ao álbum, retorna `true` se foi adicionada, `false` se já existia
  bool adicionarFigura(Figura figura) {
    return _figurasColadas.add(figura);
  }

  /// Verifica se o álbum está completo
  bool estaCompleto() {
    return _figurasColadas.length == _todasFiguras.length;
  }

  /// Imprime as figurinhas coladas no álbum em ordem
  void imprimirAlbum() {
    for (var figura in _figurasColadas) {
      print(figura);
    }
  }
}
