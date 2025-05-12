import 'package:flutter/material.dart';

class itensDaLista {
  const itensDaLista(this.cor, this.texto);

  final Color cor;
  final String texto;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: { '/': (context) => const tela1(),
        '/cor': (context) {
          return RotaCor(ModalRoute
              .of(context)!
              .settings
              .arguments as Color);
        },
      },
    );
  }
}

class tela1 extends StatelessWidget {
  const tela1();

  final cores = const [
    itensDaLista(Colors.red, 'Vermelho'),
    itensDaLista(Colors.green, 'Verde'),
    itensDaLista(Colors.blue, 'Azul'),
    itensDaLista(Colors.purple, 'Roxo'),
    itensDaLista(Colors.orange, 'Laranja'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione uma cor'),
      ),
      body: ListView.builder(
          itemCount: cores.length,
        itemBuilder: (context, index) {
            final item = cores[index];
            return CorItem(item.texto, item.cor);
        },
      ),
    );
  }
}


class RotaCor extends StatelessWidget {
  const RotaCor(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cor selecionada'),
      ),
      body: Container(
        color: color,
      ),
    );
  }
}

class CorItem extends StatelessWidget {
  const CorItem(this.texto, this.cor);

  final Color cor;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/cor', arguments: cor);
      },
      child: Container(
        color: cor,
        height: 48,
        child: Center(
          child: Text(texto),
        ),
      ),
    );
  }
}



