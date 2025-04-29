void main() {
  final biblioteca = BibliotecaDeMusicas();

  // Adicionando músicas
  biblioteca.adicionar(
    Musica('Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 354),
  );
  biblioteca.adicionar(Musica('Imagine', 'John Lennon', 'Imagine', 183));
  biblioteca.adicionar(
    Musica('Hotel California', 'Eagles', 'Hotel California', 391),
  );
  biblioteca.adicionar(
    Musica('Billie Jean', 'Michael Jackson', 'Thriller', 294),
  );
  biblioteca.adicionar(Musica('Thriller', 'Michael Jackson', 'Thriller', 357));

  // Impressão da biblioteca
  biblioteca.imprimirBiblioteca();

  // Realizando buscas
  print('\n--- BUSCA POR TÍTULO: "Imagine" ---');
  biblioteca.buscarPorTitulo('Imagine');

  print('\n--- BUSCA POR ARTISTA: "Michael Jackson" ---');
  biblioteca.buscarPorArtista('Michael Jackson');

  print('\n--- BUSCA POR ÁLBUM: "Thriller" ---');
  biblioteca.buscarPorAlbum('Thriller');
}

class Musica {
  final String titulo;
  final String artista;
  final String album;
  final int duracaoEmSegundos;

  Musica(this.titulo, this.artista, this.album, this.duracaoEmSegundos);

  String get duracaoFormatada {
    final minutos = duracaoEmSegundos ~/ 60;
    final segundos = duracaoEmSegundos % 60;
    return '${minutos}m ${segundos}s';
  }

  @override
  String toString() {
    return '"$titulo" por $artista - Álbum: $album (${duracaoFormatada})';
  }
}

class BibliotecaDeMusicas {
  final List<Musica> _musicas = [];

  void adicionar(Musica musica) {
    _musicas.add(musica);
  }

  void imprimirBiblioteca() {
    print('\n--- BIBLIOTECA DE MÚSICAS ---');
    for (final musica in _musicas) {
      print(musica);
    }

    print('\nTotal de músicas: ${_musicas.length}');
    print('Tempo total: ${_tempoTotalEmHoras().toStringAsFixed(2)} horas');
  }

  double _tempoTotalEmHoras() {
    final totalSegundos = _musicas.fold<int>(
      0,
      (soma, musica) => soma + musica.duracaoEmSegundos,
    );
    return totalSegundos / 3600.0;
  }

  void buscarPorTitulo(String titulo) {
    final resultados = _musicas.where(
      (m) => m.titulo.toLowerCase() == titulo.toLowerCase(),
    );
    _imprimirResultadosBusca(resultados);
  }

  void buscarPorArtista(String artista) {
    final resultados = _musicas.where(
      (m) => m.artista.toLowerCase() == artista.toLowerCase(),
    );
    _imprimirResultadosBusca(resultados);
  }

  void buscarPorAlbum(String album) {
    final resultados = _musicas.where(
      (m) => m.album.toLowerCase() == album.toLowerCase(),
    );
    _imprimirResultadosBusca(resultados);
  }

  void _imprimirResultadosBusca(Iterable<Musica> resultados) {
    if (resultados.isEmpty) {
      print('Nenhuma música encontrada.');
    } else {
      for (final musica in resultados) {
        print(musica);
      }
    }
  }
}
