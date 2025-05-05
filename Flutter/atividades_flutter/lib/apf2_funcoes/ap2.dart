import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget modeloStack(Color? cor, double alinhamento) {
    return Positioned(
      top: alinhamento,
        left: alinhamento,
        child: Container(
          width: 50,
          height: 50,
          color: cor
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Ap2')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.grey,
              padding: EdgeInsets.all(8),
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  modeloStack(Colors.red, 0),
                  modeloStack(Colors.green, 8),
                  modeloStack(Colors.blue, 16),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(8),
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  modeloStack(Colors.cyan, 0),
                  modeloStack(Colors.purple, 8),
                  modeloStack(Colors.yellow, 16),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  modeloStack(Colors.red, 0),
                  modeloStack(Colors.yellow, 8),
                  modeloStack(Colors.blue, 16),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(8),
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  modeloStack(Colors.deepPurple, 0),
                  modeloStack(Colors.deepOrange, 8),
                  modeloStack(Colors.yellow, 16),
                  modeloStack(Colors.lightGreen, 24),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
