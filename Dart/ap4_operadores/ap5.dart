void main() {
  Map<String, int?> pessoas = {
    'Nelson': null,
    'Jane': null,
    'Jack': 16,
    'Rupert': 37,
    'Andy': 13,
    'Kim': 27,
    'Robert': 31
  };

  for (final nome in pessoas.keys) {
    final idade = pessoas[nome];
    print('$nome - ${idade ?? 'idade não informada'}');
  }
}
