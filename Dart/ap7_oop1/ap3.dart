void main() {
  List<Produto> listaProduto = [
    Produto('Colgate', 5.99, 15.0),
    Produto('Listerine', 15.99, 7.5),
    Produto('Bola Wilson', 199.99, 20.0),
    Produto('Carro de controle remoto', 359.99, 15.0),
    Produto('Televisão', 2999.99, 7.5)
  ];
  for (var i in listaProduto) {
    double produtoFinal = i.desconto(i.taxa);
    print(
        'Novo preço do produto ${i.nome} (com desconto) ${produtoFinal.toStringAsFixed(2)}');
  }
}

class Produto {
  Produto(this.nome, this.preco, this.taxa);

  final nome;
  final preco;
  final taxa;

  double desconto(taxa) {
    final produtoFinal = preco - (preco * (taxa / 100));
    return produtoFinal;
  }
}
