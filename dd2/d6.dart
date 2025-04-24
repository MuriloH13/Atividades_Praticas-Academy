import 'dart:collection';

void main() {
  final baralho = Baralho();

  // Inserindo cartas na ordem especificada
  baralho.empilhar(Carta('A', Naipe.paus)); // ♣
  baralho.empilhar(Carta('A', Naipe.copas)); // ♥
  baralho.empilhar(Carta('A', Naipe.espadas)); // ♠
  baralho.empilhar(Carta('A', Naipe.ouros)); // ♦

  // Removendo cartas do baralho, uma a uma (do topo)
  while (!baralho.estaVazio) {
    final carta = baralho.removerDoTopo();
    print('Removendo carta: ${carta.valor} ${carta.simboloNaipe}');
  }
}

// Enum para os naipes válidos
enum Naipe { paus, copas, espadas, ouros }

// Representa uma carta
class Carta {
  final String valor;
  final Naipe naipe;

  Carta(this.valor, this.naipe);

  String get simboloNaipe {
    switch (naipe) {
      case Naipe.paus:
        return '\u2663'; // ♣
      case Naipe.copas:
        return '\u2665'; // ♥
      case Naipe.espadas:
        return '\u2660'; // ♠
      case Naipe.ouros:
        return '\u2666'; // ♦
    }
  }
}

// Classe do Baralho usando Queue
class Baralho {
  final Queue<Carta> _cartas = Queue<Carta>();

  void empilhar(Carta carta) {
    _cartas.addLast(carta); // empilha no topo (fim da fila)
  }

  Carta removerDoTopo() {
    return _cartas.removeLast(); // remove do topo (fim da fila)
  }

  bool get estaVazio => _cartas.isEmpty;
}
