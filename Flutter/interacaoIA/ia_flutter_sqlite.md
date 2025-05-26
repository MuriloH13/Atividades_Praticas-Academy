# Introdução ao Banco de Dados SQLite no Flutter

## O que é um banco de dados SQLite e como ele funciona em Flutter?

SQLite é um banco de dados relacional leve e embutido que armazena dados localmente no dispositivo. No Flutter, ele é comumente utilizado com o pacote `sqflite`, que fornece uma interface simples para executar comandos SQL.

## Quais são as vantagens de usar SQLite em aplicativos Flutter?

* Armazenamento local persistente
* Não requer servidor
* Baixo consumo de memória e CPU
* Compatível com transações

## Quais são os tipos de dados básicos que posso armazenar em um banco de dados SQLite?

* INTEGER
* TEXT
* REAL
* BLOB
* NULL

## Como posso inserir novos registros em uma tabela SQLite usando Flutter?

```dart
await db.insert('usuarios', {'nome': 'João', 'idade': 25});
```

## Como posso inserir vários registros de uma vez em uma tabela SQLite?

Use uma transação:

```dart
await db.transaction((txn) async {
  await txn.insert('usuarios', {'nome': 'Ana', 'idade': 30});
  await txn.insert('usuarios', {'nome': 'Carlos', 'idade': 28});
});
```

## Como posso obter o ID do último registro inserido em uma tabela SQLite?

```dart
int id = await db.insert('usuarios', {'nome': 'Maria'});
```

## Como posso filtrar os resultados de uma consulta usando a cláusula WHERE?

```dart
List<Map<String, dynamic>> results =
    await db.query('usuarios', where: 'idade > ?', whereArgs: [18]);
```

## Como posso agrupar os resultados de uma consulta usando a cláusula GROUP BY?

```dart
await db.rawQuery('SELECT idade, COUNT(*) FROM usuarios GROUP BY idade');
```

## Como posso excluir registros de uma tabela SQLite usando Flutter?

```dart
await db.delete('usuarios', where: 'id = ?', whereArgs: [1]);
```

## Quais os cuidados necessários ao usar UPDATE, INSERT e DELETE?

* Sempre validar os dados antes de inserir
* Usar `where` para evitar modificar/excluir todos os registros
* Utilizar transações para manter consistência em múltiplas operações

## Como posso criar tabelas relacionadas em um banco de dados SQLite?

```sql
CREATE TABLE pedidos (
  id INTEGER PRIMARY KEY,
  descricao TEXT
);

CREATE TABLE itens (
  id INTEGER PRIMARY KEY,
  pedido_id INTEGER,
  produto TEXT,
  FOREIGN KEY(pedido_id) REFERENCES pedidos(id)
);
```

## Como posso consultar dados de tabelas relacionadas usando JOIN?

```dart
await db.rawQuery('''
  SELECT pedidos.descricao, itens.produto
  FROM pedidos
  JOIN itens ON pedidos.id = itens.pedido_id
''');
```

## O que são transações em um banco de dados SQLite e por que são importantes?

Transações garantem que um conjunto de operações seja executado por completo ou nenhuma delas, mantendo a integridade dos dados.

## Como posso reverter uma transação em caso de erro?

Utilizando `transaction` do `sqflite`:

```dart
await db.transaction((txn) async {
  try {
    await txn.insert(...);
    await txn.update(...);
  } catch (e) {
    throw Exception('Erro: $e');
  }
});
```

## Quais são as vantagens de usar transações para garantir a integridade dos dados?

* Evita dados corrompidos
* Garante atomicidade (tudo ou nada)
* Aumenta a confiabilidade em operações críticas
