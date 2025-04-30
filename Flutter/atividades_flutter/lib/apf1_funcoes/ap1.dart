import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

Color sorteiaCor() {
    Random random = Random();

    final alpha = random.nextInt(256);
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);

    return Color.fromARGB(alpha, red, green, blue);
}

void main() {
    runApp(MyApp());
}

class MyApp extends StatefulWidget {

    MyApp({Key? key}) : super(key: key);

    @override
    _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    Color corDoTexto = Colors.black;

    void trocarCor() {
        setState(() {
            corDoTexto = sorteiaCor();
        });
    }

    @override
    Widget build(BuildContext context) {

        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(title: Text('ap1')),
                body: Center(
                    child: TextButton(
                        onPressed: () {
                            trocarCor();
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: corDoTexto,
                            backgroundColor: Colors.black12,
                        ),
                        child: Text(
                            'Sorteia cor',
                            style: TextStyle(fontSize: 30),
                        ),
                    ),
                ),
            ),
        );
    }
}