import 'dart:math';
import 'dart:io';
import 'dart:core';

void main() {
  final random = Random();

  List<int> lista = List.generate(50, (_) => random.nextInt(11) + 10);
  List<int> listaunica = lista.toSet().toList();

  stdout.write('Lista Original: ');
  for (var indice = 0; indice < lista.length; indice++) {
    stdout.write('${lista[indice]} ; ');
  }
  stdout.write('\nItens Únicos: ');
  lista.toSet().toList();
  for (var indice = 0; indice < listaunica.length; indice++) {
    stdout.write('${listaunica[indice]} ; ');
  }
}
