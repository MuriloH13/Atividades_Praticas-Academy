void main(List<String> args) {
  try {
    final nomeArquivo = args[0];
    ArquivoTexto arquivoTexto = ArquivoTexto(nomeArquivo);
    arquivoTexto.abrir();
  } catch (e) {
    print(e);
  } finally {
    print('Fim do programa');
  }
}

abstract class Arquivo {
  void abrir();
}

class ArquivoTexto implements Arquivo {
  ArquivoTexto(this.nome);

  final String nome;

  @override
  void abrir() {
    try {
      throw Exception('Erro ao abrir o arquivo $nome');
    } catch (e) {
      print('Relançar a exception');
      rethrow;
    }
  }
}
