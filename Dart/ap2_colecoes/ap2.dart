import 'dart:io';
import 'dart:math';
import 'dart:core';

void main() {
  final random = Random();

  List<int> lista = List.generate(50, (_) => random.nextInt(15));

  stdout.write('Lista Original: ');
  for (var indice = 0; indice < lista.length; indice++) {
    stdout.write('${lista[indice]} ; ');
  }
  lista.removeWhere((item) => item.isEven);

  stdout.write('\nLista Atualizada: ');
  for (var indice = 0; indice < lista.length; indice++) {
    stdout.write('${lista[indice]} ; ');
  }
}
