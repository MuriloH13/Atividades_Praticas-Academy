import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => EstadoListaDePessoas(),
    child: MyApp(),
  ));
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

const Map<TipoSanguineo, Color> tipoSanguineoCores = {
  TipoSanguineo.aPositivo: Colors.blue,
  TipoSanguineo.aNegativo: Colors.red,
  TipoSanguineo.bPositivo: Colors.purple,
  TipoSanguineo.bNegativo: Colors.orange,
  TipoSanguineo.oPositivo: Colors.green,
  TipoSanguineo.oNegativo: Colors.yellow,
  TipoSanguineo.abPositivo: Colors.cyan,
  TipoSanguineo.abNegativo: Colors.white,
};

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];
  String filtro = '';

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  void alterar(int index, Pessoa novaPessoa) {
    _listaDePessoas[index] = novaPessoa;
    notifyListeners();
  }

  void filtrar(String texto) {
    filtro = texto;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Pessoas',
      initialRoute: '/',
      routes: {
        '/': (_) => TelaInicial(),
        '/lista': (_) => TelaLista(),
        '/form': (_) => TelaFormulario(),
      },
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Inicial')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/lista'),
              child: Text('Listar Pessoas'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/form'),
              child: Text('Incluir Pessoa'),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final estado = context.watch<EstadoListaDePessoas>();
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Pessoas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Filtrar por nome'),
              onChanged: estado.filtrar,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: estado.pessoas.length,
              itemBuilder: (context, index) {
                final pessoa = estado.pessoas[index];
                return Card(
                  color: tipoSanguineoCores[pessoa.tipoSanguineo],
                  child: ListTile(
                    title: Text(pessoa.nome),
                    subtitle: Text('${pessoa.email}\n${pessoa.telefone}\n${pessoa.github}'),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => estado.excluir(pessoa),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TelaFormulario(
                          pessoa: pessoa,
                          index: index,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class TelaFormulario extends StatefulWidget {
  final Pessoa? pessoa;
  final int? index;

  const TelaFormulario({this.pessoa, this.index});

  @override
  _TelaFormularioState createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final _formKey = GlobalKey<FormState>();
  late String nome, email, telefone, github;
  TipoSanguineo tipoSanguineo = TipoSanguineo.aPositivo;

  @override
  void initState() {
    super.initState();
    if (widget.pessoa != null) {
      nome = widget.pessoa!.nome;
      email = widget.pessoa!.email;
      telefone = widget.pessoa!.telefone;
      github = widget.pessoa!.github;
      tipoSanguineo = widget.pessoa!.tipoSanguineo;
    } else {
      nome = email = telefone = github = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final estado = context.read<EstadoListaDePessoas>();

    return Scaffold(
      appBar: AppBar(title: Text(widget.pessoa == null ? 'Incluir Pessoa' : 'Editar Pessoa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: nome,
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => nome = value!,
              ),
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => email = value!,
              ),
              TextFormField(
                initialValue: telefone,
                decoration: InputDecoration(labelText: 'Telefone'),
                onSaved: (value) => telefone = value!,
              ),
              TextFormField(
                initialValue: github,
                decoration: InputDecoration(labelText: 'GitHub'),
                onSaved: (value) => github = value!,
              ),
              DropdownButtonFormField<TipoSanguineo>(
                value: tipoSanguineo,
                items: TipoSanguineo.values.map((tipo) {
                  return DropdownMenuItem(
                    value: tipo,
                    child: Text(tipo.toString().split('.').last.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) => setState(() => tipoSanguineo = value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  final novaPessoa = Pessoa(
                    nome: nome,
                    email: email,
                    telefone: telefone,
                    github: github,
                    tipoSanguineo: tipoSanguineo,
                  );
                  if (widget.pessoa == null) {
                    estado.incluir(novaPessoa);
                  } else {
                    estado.alterar(widget.index!, novaPessoa);
                  }
                  Navigator.pop(context);
                },
                child: Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
