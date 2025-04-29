int calcDesconto(int valorProduto, int valorDesconto) {
  final desconto = ((valorProduto - valorDesconto) * 100) / valorProduto;
  return desconto.toInt();
}

void main() {
  final produto = 10;
  final produtoDesconto = 7;

  final porcentagemDesconto = (calcDesconto(produto, produtoDesconto));

  print(
      'O produto custava $produto reais, foi vendido por $produtoDesconto reais. O desconto dado foi $porcentagemDesconto%');
}
