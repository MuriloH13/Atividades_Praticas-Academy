// NAO PODE SER MODIFICADO
// -------------------------------------------------------------
import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  return meiosDeComunicacao[random.nextInt(meiosDeComunicacao.length)];
}

// -------------------------------------------------------------
// ADICIONAR IMPLEMENTACAO RESTANTE ABAIXO DESSA LINHA
// -------------------------------------------------------------

class Telefone extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print('[Telefone] ligando para $numero');
  }
}

class Celular extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print('[Celular] ligando para $numero');
  }
}

class Orelhao extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print('[Orelhao] ligando para $numero');
  }
}

abstract class MeioDeComunicacao {
  void fazerLigacao(String numero) {}
}

// ...
