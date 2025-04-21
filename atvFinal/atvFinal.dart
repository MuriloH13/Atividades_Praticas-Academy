import 'dart:io';
import 'dart:convert';
import 'package:yaansi/yaansi.dart';

void main() async {
  await opcoes();
}

Future<void> opcoes() async {
  print('''
OLÁ LEANDRO, QUE RELATÓRIO VOCÊ PRECISA?
1 - TEMPERATURA
2 - UMIDADE
3 - DIREÇÃO DO VENTO
DIGITE O NÚMERO DA OPÇÃO DESEJADA: ''');

  final opcao = int.tryParse(stdin.readLineSync() ?? '');
  switch (opcao) {
    case 1:
      await relatorioTemperatura();
      break;
    case 2:
      await relatorioUmidade();
      break;
    case 3:
      await relatorioVento();
      break;
    default:
      print('Digite um número válido!');
  }
}

Future<void> relatorioTemperatura() async {
  try {
    final registros = await atribuirValores();

    final anual = calcularEstatisticas(
      registros,
      (r) => '${r.estado} = ${r.ano}',
      (r) => r.temperatura,
    );

    final mensal = calcularEstatisticas(
        registros,
        (r) => '${r.estado} - ${r.ano}/${r.mes.toString().padLeft(2, '0')}',
        (r) => r.temperatura);

    final horario = calcularEstatisticas(
        registros, (r) => '${r.estado} - ${r.hora}', (r) => r.temperatura);

    exibirTemperatura(anual, 'MÉDIA/MÁX/MÍN POR ESTADO POR ANO');
    exibirTemperatura(mensal, 'MÉDIA/MÁX/MÍN POR ESTADO POR MÊS');
    exibirTemperatura(horario, 'MÉDIA POR HORÁRIO POR ESTADO');
  } catch (e) {
    stderr.writeln(red('Erro ao gerar relatório de temperatura: $e'));
  }
}

Future<void> relatorioUmidade() async {
  try {
    final registros = await atribuirValores();

    final porAno = calcularEstatisticas(
      registros,
      (r) => '${r.estado} - ${r.ano}',
      (r) => r.umidade,
    );

    final porMes = calcularEstatisticas(
      registros,
      (r) => '${r.estado} - ${r.ano}/${r.mes.toString().padLeft(2, '0')}',
      (r) => r.umidade,
    );

    exibirUmidade(porAno, 'UMIDADE POR ESTADO POR ANO');
    exibirUmidade(porMes, 'UMIDADE POR ESTADO POR MÊS');
  } catch (e) {
    stderr.writeln(red('Erro ao gerar relatório de umidade: $e'));
  }
}

Future<void> relatorioVento() async {
  try {
    final registros = await atribuirValores();

    final direcao = calcularEstatisticas(
      registros,
      (r) => '${r.estado} - ${r.direcaoVento}°',
      (r) => r.velocidadeVento.toDouble(),
    );

    stdout.writeln(green('\nDIREÇÃO DO VENTO MÉDIA POR ESTADO E DIREÇÃO:'));
    for (var est in direcao) {
      stdout.writeln(
          '${bold('-> ${est.grupo}:')} ${cyan('${est.media.toStringAsFixed(2)} m/s')}');
    }
  } catch (e) {
    stderr.writeln(red('Erro ao gerar relatório de vento: $e'));
  }
}

Future<List<RegistroClima>> atribuirValores() async {
  final registros = <RegistroClima>[];
  final dir = Directory('C:/CLIMA/SENSORES');

  if (!await dir.exists()) {
    stderr.writeln(red('Diretório não encontrado: C:/CLIMA/SENSORES'));
    return registros;
  }

  final arquivos = dir
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('.csv'));

  for (final arquivo in arquivos) {
    final nome = arquivo.uri.pathSegments.last;
    final partes = nome.split('_');
    if (partes.length < 3) continue;
    final estado = partes[0];
    final ano = int.tryParse(partes[1]) ?? 0;

    final registrosDoArquivo = await lerRegistro(arquivo, estado, ano);
    registros.addAll(registrosDoArquivo);
  }

  return registros;
}

Future<List<RegistroClima>> lerRegistro(
    File arquivo, String estado, int ano) async {
  final registros = <RegistroClima>[];

  try {
    final bytes = await arquivo.readAsBytes();
    final conteudo = latin1.decode(bytes);

    final linhas = LineSplitter.split(conteudo).toList();
    if (linhas.length <= 1) return registros;

    for (var i = 1; i < linhas.length; i++) {
      final colunas = linhas[i].split(',');

      if (colunas.length < 8) continue;

      final mes = int.parse(colunas[0]);
      final dia = int.parse(colunas[1]);
      final hora = int.parse(colunas[2]);
      final temperatura = double.tryParse(colunas[3]) ?? 0.0;
      final umidade = (double.tryParse(colunas[4]) ?? 0.0) * 100;
      final densidadeAr = double.tryParse(colunas[5]) ?? 0.0;
      final velocidadeVento = int.tryParse(colunas[6]) ?? 0;
      final direcaoVento = int.tryParse(colunas[7]) ?? 0;

      registros.add(RegistroClima(
        estado: estado,
        ano: ano,
        mes: mes,
        dia: dia,
        hora: hora,
        temperatura: temperatura,
        umidade: umidade,
        densidadeAr: densidadeAr,
        velocidadeVento: velocidadeVento,
        direcaoVento: direcaoVento,
      ));
    }
  } catch (e) {
    stderr.writeln(red('Erro ao ler o arquivo ${arquivo.path}: $e'));
  }

  return registros;
}

class RegistroClima {
  final String estado;
  final int ano;
  final int mes;
  final int dia;
  final int hora;
  final double temperatura;
  final double umidade;
  final double densidadeAr;
  final int velocidadeVento;
  final int direcaoVento;

  RegistroClima({
    required this.estado,
    required this.ano,
    required this.mes,
    required this.dia,
    required this.hora,
    required this.temperatura,
    required this.umidade,
    required this.densidadeAr,
    required this.velocidadeVento,
    required this.direcaoVento,
  });
}

class Estatistica {
  final String grupo;
  final double media;
  final double minima;
  final double maxima;

  Estatistica(this.grupo, this.media, this.minima, this.maxima);
}

List<Estatistica> calcularEstatisticas(
  List<RegistroClima> registros,
  String Function(RegistroClima) chaveDeAgrupamento,
  double Function(RegistroClima) seletorDeValor,
) {
  final mapa = <String, List<double>>{};

  for (var registro in registros) {
    final chave = chaveDeAgrupamento(registro);
    mapa.putIfAbsent(chave, () => []).add(seletorDeValor(registro));
  }

  final estatisticas = <Estatistica>[];

  mapa.forEach((chave, valores) {
    final media = valores.reduce((a, b) => a + b) / valores.length;
    final minima = valores.reduce((a, b) => a < b ? a : b);
    final maxima = valores.reduce((a, b) => a > b ? a : b);

    estatisticas.add(Estatistica(chave, media, minima, maxima));
  });
  return estatisticas;
}

void exibirTemperatura(List<Estatistica> estatisticas, String descricao) {
  stdout.writeln(green('\n$descricao'));

  for (var est in estatisticas) {
    stdout.writeln('''
${bold('-> ${est.grupo}:')}
  ${red('Celsius Média:')} ${red(est.media.toStringAsFixed(2))} °C
  ${red('Celsius Máx.:')} ${red(est.maxima.toStringAsFixed(2))} °C
  ${red('Celsius Mín.:')} ${red(est.minima.toStringAsFixed(2))} °C

  ${yellow('Fahrenheit Média:')} ${yellow((est.media * 1.8 + 32).toStringAsFixed(2))} °F
  ${yellow('Fahrenheit Máx.:')} ${yellow((est.maxima * 1.8 + 32).toStringAsFixed(2))} °F
  ${yellow('Fahrenheit Mín.:')} ${yellow((est.minima * 1.8 + 32).toStringAsFixed(2))} °F

  ${blue('Kelvin Média:')} ${blue((est.media + 273.15).toStringAsFixed(2))} K
  ${blue('Kelvin Máx.:')} ${blue((est.maxima + 273.15).toStringAsFixed(2))} K
  ${blue('Kelvin Mín.:')} ${blue((est.minima + 273.15).toStringAsFixed(2))} K
''');
  }
}

void exibirUmidade(List<Estatistica> estatisticas, String descricao) {
  stdout.writeln(green('\n$descricao'));

  for (var est in estatisticas) {
    stdout.writeln('''
${bold('-> ${est.grupo}:')}
  ${green('Média:')} ${green(est.media.toStringAsFixed(2))} %
  ${red('Máxima:')} ${red(est.maxima.toStringAsFixed(2))} %
  ${blue('Mínima:')} ${blue(est.minima.toStringAsFixed(2))} %
''');
  }
}
