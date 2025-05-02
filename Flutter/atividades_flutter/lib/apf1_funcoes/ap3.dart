import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

enum EstadoJogo {
  emAndamento,
  ganhou,
  perdeu,
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  var vitorias = 0;
  var derrotas = 0;
  var botaoCorreto = 0;
  var clicks = 0;
  var estadoDoJogo = EstadoJogo.emAndamento;

  // Esse método é chamado somente uma vez, ao iniciar o state
  @override
  void initState() {
    super.initState();

    iniciarJogo();
  }

  // Tratar a tentativa do usuário
  void tentativa(int opcao) {
    setState(() {
      // Verificar se a opção escolhida esta correta
      if (opcao == botaoCorreto) {
        estadoDoJogo = EstadoJogo.ganhou;
        vitorias++;
      } else {
        // Se estiver errada, incrementa o contador de clicks
        clicks++;
      }

      // Se a quantidade de clicks for maior ou igual a 2, o usuário perdeu
      if (clicks >= 2 && estadoDoJogo != EstadoJogo.ganhou) {
        estadoDoJogo = EstadoJogo.perdeu;
        derrotas++;
      }
    });
  }

  void iniciarJogo() {
    setState(() {
      botaoCorreto = random.nextInt(3);

      clicks = 0;

      estadoDoJogo = EstadoJogo.emAndamento;
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (estadoDoJogo) {
      EstadoJogo.ganhou => GanhouJogo(iniciarJogo),
      EstadoJogo.perdeu => PerdeuJogo(iniciarJogo),
      EstadoJogo.emAndamento => JogoEmAndamento(vitorias, derrotas, tentativa),

    };
  }
}

class PerdeuJogo extends StatelessWidget {
  const PerdeuJogo(this.reiniciar);

  final void Function() reiniciar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          const Text('Você perdeu'),
          ElevatedButton(
            child: const Text('Jogar novamente'),
            onPressed: () {
            reiniciar();
          },
          ),
        ]),
    );
  }
}

class GanhouJogo extends StatelessWidget {
  const GanhouJogo(this.reiniciar);

  final void Function() reiniciar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          const Text('Você ganhou'),
          ElevatedButton(
            child: Text('Jogar novamente'),
              onPressed: () {
              reiniciar();
          },
          ),
        ],
      ),
    );
}
}

class JogoEmAndamento extends StatelessWidget {
  const JogoEmAndamento(
      this.vitorias,
      this.derrotas,
      this.tentativa,
      );

  final int vitorias;
  final int derrotas;

  final void Function(int) tentativa;

  @override
  Widget build(BuildContext build) {
    return Column(
      children: [
        Text('Vitórias: $vitorias'),
        Text('Derrotas: $derrotas'),
        ElevatedButton(
          child: Text('A'),
          onPressed: () {
            tentativa(0);
          },
        ),
        ElevatedButton(
          child: Text('B'),
          onPressed: () {
            tentativa(1);
          },
        ),
        ElevatedButton(
          child: Text('C'),
          onPressed: () {
            tentativa(2);
          },
        ),
      ],
    );
  }
}