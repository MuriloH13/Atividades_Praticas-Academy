class Item {
  final String nome;
  final int quantidade;
  bool comprado;
  bool semEstoque;

  Item(this.nome, this.quantidade) : comprado = false, semEstoque = false;
}

// Classe principal que controla a lista de compras
class ListaDeCompras {
  final List<Item> _itensDesejados = [];

  // Incluir novos itens desejados
  void adicionarItem(String nome, int quantidade) {
    _itensDesejados.add(Item(nome, quantidade));
  }

  // Marcar um item como comprado
  void marcarComoComprado(String nome) {
    final item = _itensDesejados.firstWhere(
      (item) => item.nome == nome && !item.comprado && !item.semEstoque,
      orElse:
          () => throw Exception('Item "$nome" não encontrado ou já processado'),
    );
    item.comprado = true;
  }

  // Marcar um item como sem estoque
  void marcarComoSemEstoque(String nome) {
    final item = _itensDesejados.firstWhere(
      (item) => item.nome == nome && !item.comprado && !item.semEstoque,
      orElse:
          () => throw Exception('Item "$nome" não encontrado ou já processado'),
    );
    item.semEstoque = true;
  }

  // Separar os itens comprados
  List<Item> get itensComprados =>
      _itensDesejados.where((item) => item.comprado).toList();

  // Separar os itens sem estoque
  List<Item> get itensSemEstoque =>
      _itensDesejados.where((item) => item.semEstoque).toList();

  // Mostrar os itens ainda pendentes
  List<Item> get itensPendentes =>
      _itensDesejados
          .where((item) => !item.comprado && !item.semEstoque)
          .toList();

  // Escolher um item pendente aleatoriamente
  Item escolherItemAleatorio() {
    final pendentes = itensPendentes;
    if (pendentes.isEmpty) {
      throw Exception('Não há itens pendentes.');
    }
    pendentes.shuffle();
    return pendentes.first;
  }

  // Exibir todos os itens desejados com suas quantidades
  void exibirItensDesejados() {
    print('Itens desejados:');
    for (var item in _itensDesejados) {
      print('- ${item.nome} (Quantidade: ${item.quantidade})');
    }
  }

  // Mostrar o progresso da compra
  void mostrarProgresso() {
    final total = _itensDesejados.length;
    final comprados = itensComprados.length;
    print('Progresso: $comprados/$total');
  }
}

void main() {
  final lista = ListaDeCompras();

  // Simular criação de lista com 3 itens
  lista.adicionarItem('Arroz', 2);
  lista.adicionarItem('Feijão', 1);
  lista.adicionarItem('Leite', 3);

  // Exibir itens desejados
  lista.exibirItensDesejados();

  // Marcar 2 itens como comprados
  lista.marcarComoComprado('Arroz');
  lista.marcarComoComprado('Feijão');

  // Marcar 1 item como sem estoque
  lista.marcarComoSemEstoque('Leite');

  // Exibir progresso
  lista.mostrarProgresso();

  // Tentar escolher item aleatório (deve lançar exceção pois todos foram marcados)
  try {
    final aleatorio = lista.escolherItemAleatorio();
    print('Item aleatório: ${aleatorio.nome}');
  } catch (e) {
    print(e);
  }

  // Separar itens comprados e sem estoque
  print('\nItens comprados:');
  for (var item in lista.itensComprados) {
    print('- ${item.nome}');
  }

  print('\nItens sem estoque:');
  for (var item in lista.itensSemEstoque) {
    print('- ${item.nome}');
  }
}
