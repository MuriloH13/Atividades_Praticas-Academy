import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget container(double largura, double altura, Color cor) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: largura,
      height: altura,
      color: cor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text('Ap1'
        ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                container(50, 50, Colors.red),
                container(50, 50, Colors.green),
                container(50, 50, Colors.blue),
              ],
            ),
            Container(
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  container(50, 100, Colors.purple),
                  container(50, 100, Colors.cyan),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        color: Colors.purple,
                        width: 50,
                        height: 50,
                      ),
                      container(50, 50, Colors.cyan),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    container(110, 80, Colors.grey),
                    container(50, 50, Colors.black),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
