import 'dart:math';

import 'package:flutter/material.dart';

Color corAleatoria() {
  Random  random = Random();
  int a = random.nextInt(256);
  int r = random.nextInt(256);
  int g = random.nextInt(256);
  int b = random.nextInt(256);
  Color cor = Color.fromARGB(a, r, g, b);

  return cor;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color randomColor = Colors.red;
  bool redondo = false;

  void trocarCor() {
    setState(() {
      randomColor = corAleatoria();
    });
  }

  void alternarForma() {
    setState(() {
      redondo = !redondo;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Ap3')),
        body: Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    alternarForma();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                  child: Text(
                    redondo ? 'Mudar para quadrado' :
                    'Mudar para circulo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    trocarCor();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                  child: Text(
                    'Cor aleatória',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(redondo ? 50 : 0),
              color: randomColor),
            )
          ],
        ),
      ),
    );
  }
}
