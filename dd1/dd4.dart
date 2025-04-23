void main() {
  DateTime dataInicial = DateTime(2022, 09, 05);
  DateTime dataFinal = addDiasUteis(dataInicial, 18);
  String inicialFormatada =
      '${dataInicial.day.toString().padLeft(2, '0')}/'
      '${dataInicial.month.toString().padLeft(2, '0')}/'
      '${dataInicial.year}';

  String finalFormatada =
      '${dataFinal.day.toString().padLeft(2, '0')}/'
      '${dataFinal.month.toString().padLeft(2, '0')}/'
      '${dataFinal.year}';

  print('Data atual: $inicialFormatada');
  print('Data calculada: $finalFormatada');
}

int calcularDias(int dia) {
  dia += 24;
  return dia;
}

bool diaSemana(DateTime date) {
  return date.weekday >= DateTime.monday && date.weekday <= DateTime.friday;
}

DateTime addDiasUteis(DateTime datainicial, int dias) {
  int adicionados = 0;
  DateTime dataAtual = datainicial;
  while (adicionados < dias) {
    dataAtual = dataAtual.add(Duration(days: 1));
    if (diaSemana(dataAtual)) {
      adicionados++;
    }
  }
  return dataAtual;
}
