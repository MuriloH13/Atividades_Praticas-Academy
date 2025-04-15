void main() {
  Computador computador = Computador();
  computador.inicializando();
  computador.insiraASenha();
}

abstract class Inicializar {
  void inicializando() {}
}

abstract class Senha {
  void insiraASenha() {}
}

class Computador implements Inicializar, Senha {
  @override
  void inicializando() {
    print('O computador está inicializando');
  }

  @override
  void insiraASenha() {
    print('O computador está pedindo uma senha');
  }
}
