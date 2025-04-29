void maind() {
  final conta = ContaBancaria(2500.00, 'Murilo');
}

class ContaBancaria {
  ContaBancaria(this.saldo, this.titular);
  String titular;
  double saldo;

  void depositarDinheiro(double dinheiro) {
    saldo += dinheiro;
  }

  void sacarDinheiro(double dinheiro) {
    if (dinheiro <= saldo) {
      saldo -= dinheiro;
    } else {
      print('Saldo insuficiente');
    }
  }
}
