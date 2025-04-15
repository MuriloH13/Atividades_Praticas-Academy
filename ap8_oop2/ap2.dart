void main() {
  final cavalo = Cavalo();
  cavalo.beber();
  cavalo.comer();
  cavalo.relinchar();
}

abstract class Animal {
  void comer() {
    print('O animal está comendo');
  }

  void beber() {
    print('O animal está bebendo');
  }
}

class Cavalo extends Animal {
  void relinchar() {
    print('O cavalo está relinchando');
  }
}
