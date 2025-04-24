import 'dart:math';

void main() {
  final pessoa = Pessoa();
  final fornecedor = <Fornecedores>[
    FornecedorDeBebidas(),
    FornecedorDeBolos(),
    FornecedorDePetiscos(),
    FornecedorDeSaladas(),
    FornecedorDeSanduiches(),
    FornecedorUltraCaloricos(),
  ];

  final random = Random();

  // Consumindo produtos fornecidos
  while (pessoa.precisaRefeicoes()) {
    final fornecedorAleatorio = fornecedor[random.nextInt(fornecedor.length)];
    pessoa.refeicao(fornecedorAleatorio);
  }

  pessoa.informacoes();
}

enum Status { deficitExtremo, deficit, satisfeito, excesso }

abstract class Fornecedores {
  Produto fornecer();
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

class FornecedorDeSanduiches implements Fornecedores {
  final _random = Random();
  final _itens = <Produto>[
    Produto('Sanduíche de frango', 400),
    Produto('Sanduíche de atum', 300),
    Produto('Sanduíche de queijo', 450),
  ];

  @override
  Produto fornecer() => _itens[_random.nextInt(_itens.length)];
}

class FornecedorDeBebidas implements Fornecedores {
  final _random = Random();
  final _itens = <Produto>[
    Produto('Água', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energético', 135),
    Produto('Café', 60),
    Produto('Chá', 35),
  ];

  @override
  Produto fornecer() => _itens[_random.nextInt(_itens.length)];
}

class FornecedorDeSaladas implements Fornecedores {
  final _random = Random();
  final _itens = <Produto>[
    Produto('Salada verde', 120),
    Produto('Salada de frutas', 90),
    Produto('Salada com atum', 150),
  ];

  @override
  Produto fornecer() => _itens[_random.nextInt(_itens.length)];
}

class FornecedorDePetiscos implements Fornecedores {
  final _random = Random();
  final _itens = <Produto>[
    Produto('Batata frita', 400),
    Produto('Pipoca', 300),
    Produto('Amendoim', 250),
  ];

  @override
  Produto fornecer() => _itens[_random.nextInt(_itens.length)];
}

class FornecedorDeBolos implements Fornecedores {
  final _random = Random();
  final _itens = <Produto>[
    Produto('Bolo de chocolate', 500),
    Produto('Bolo de cenoura', 350),
    Produto('Bolo de morango', 300),
  ];

  @override
  Produto fornecer() => _itens[_random.nextInt(_itens.length)];
}

class FornecedorUltraCaloricos implements Fornecedores {
  final _random = Random();
  final _itens = <Produto>[
    Produto('Pizza inteira', 1200),
    Produto('Hamburguer duplo', 950),
    Produto('Milkshake', 800),
  ];

  @override
  Produto fornecer() => _itens[_random.nextInt(_itens.length)];
}

class Pessoa {
  final Random _random = Random();
  // Acumulador de calorias
  int _caloriasConsumidas;
  int _refeicoesRealizadas = 0;

  Pessoa() : _caloriasConsumidas = 400 + Random().nextInt(2600);

  Status get status {
    if (_caloriasConsumidas <= 500) return Status.deficitExtremo;
    if (_caloriasConsumidas <= 1800) return Status.deficit;
    if (_caloriasConsumidas <= 2500) return Status.satisfeito;
    return Status.excesso;
  }

  bool precisaRefeicoes() {
    return status != Status.satisfeito && status != Status.excesso;
  }

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    print('Calorias consumidas: $_caloriasConsumidas');
    print('Refeições realizadas: $_refeicoesRealizadas');
    print('Status calórico: ${_statusDescritivo()}');
  }

  String _statusDescritivo() {
    switch (status) {
      case Status.deficitExtremo:
        return 'Déficit extremo de calorias';
      case Status.deficit:
        return 'Déficit de calorias';
      case Status.satisfeito:
        return 'Pessoa está satisfeita';
      case Status.excesso:
        return 'Excesso de calorias';
    }
  }

  /// Consome um produto e aumenta o número de calorias
  void refeicao(Fornecedores fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
    _refeicoesRealizadas++;
  }
}
