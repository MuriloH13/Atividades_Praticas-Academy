import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final numeros = [0, 1, 2];
  late int botaoCerto;
  int contador = 0;
  Color corDeFundo = Colors.white;
  bool jogoEncerrado = false;

  @override
  void initState() {
    super.initState();
    botaoCerto = Random().nextInt(numeros.length);
  }

  void sorteiaCerto(int indiceBotao) {
    if (jogoEncerrado) return;

    setState(() {
      contador++;

      if (indiceBotao == botaoCerto) {
        corDeFundo = Colors.green;
        jogoEncerrado = true;
      } else if (contador >= 2) {
        corDeFundo = Colors.red;
        jogoEncerrado = true;
      }
    });
  }
  // teste para ver se era possivel a utilização de required em um widget
  Widget botao({required String texto, required int indice}) {
    return TextButton(
      onPressed: jogoEncerrado ? null : () => sorteiaCerto(indice),
      style: TextButton.styleFrom(
        fixedSize: Size(150, 75),
        backgroundColor: Colors.black12,
      ),
      child: Text(texto),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: corDeFundo,
        appBar: AppBar(title: Text('Ap2')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              botao(texto: 'a', indice:  0),
              botao(texto: 'b', indice:  1),
              botao(texto: 'c', indice:  2),
              SizedBox(height: 20),
              if (jogoEncerrado)
                Text(
                  contador <= 2 && corDeFundo == Colors.green
                      ? 'Você Acertou!'
                      : 'Você errou!',
                  style: TextStyle(fontSize: 24),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
