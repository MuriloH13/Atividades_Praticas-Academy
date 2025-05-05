
# 📘 InteraçãoIA-Flutter – Widgets, Layouts e Listas

---

## • Explique o conceito de um widget `Row` em Flutter.

O widget `Row` organiza seus widgets filhos horizontalmente em uma única linha. Ele é útil para posicionar elementos lado a lado.

---

## • Como posso adicionar espaçamento uniforme entre os widgets em um `Row`?

Utilize o parâmetro `mainAxisAlignment` com `MainAxisAlignment.spaceEvenly`, `spaceAround` ou `spaceBetween`. Exemplo:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [Widget1(), Widget2(), Widget3()],
)
```

---

## • Qual a diferença entre `MainAxisAlignment` e `CrossAxisAlignment` em um `Row`?

- `MainAxisAlignment`: controla o alinhamento horizontal (eixo principal do Row).
- `CrossAxisAlignment`: controla o alinhamento vertical (eixo cruzado do Row).

---

## • Explique o conceito de um widget `Column` em Flutter.

O widget `Column` organiza seus widgets filhos verticalmente. Ideal para criar layouts empilhados de cima para baixo.

---

## • Qual a diferença entre `MainAxisAlignment` e `CrossAxisAlignment` em um `Column`?

- `MainAxisAlignment`: controla o alinhamento vertical (eixo principal do Column).
- `CrossAxisAlignment`: controla o alinhamento horizontal (eixo cruzado do Column).

---

## • Explique o conceito de um widget `Stack` em Flutter.

O widget `Stack` permite sobrepor widgets uns sobre os outros, como camadas. Muito útil para criar interfaces personalizadas como banners com botões e textos.

---

## • Quais as vantagens de usar `Stack` em vez de `Row` ou `Column`?

- Permite sobreposição de widgets.
- Ideal para interfaces complexas e criativas.
- Permite posicionamento exato com `Positioned`.

---

## • Como posso posicionar widgets específicos dentro de um `Stack`?

Utilize o widget `Positioned` dentro do `Stack`:

```dart
Stack(
  children: [
    Container(color: Colors.blue),
    Positioned(
      top: 20,
      left: 30,
      child: Text("Texto sobreposto"),
    ),
  ],
)
```

---

## • Como posso exibir uma imagem de um arquivo local em Flutter?

Coloque a imagem na pasta `assets` e registre no `pubspec.yaml`. Exemplo de uso:

```dart
Image.asset('assets/imagem.png')
```

---

## • Quais propriedades posso usar para controlar a aparência do texto (fonte, tamanho, cor)?

Use o widget `Text` com `TextStyle`:

```dart
Text(
  'Olá Flutter',
  style: TextStyle(
    fontSize: 20,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  ),
)
```

---

## • Como posso exibir um texto em várias linhas?

Use o widget `Text` com `softWrap: true` (opcional) ou limite com `maxLines`. O texto quebra automaticamente se necessário.

---

## • Como posso criar uma lista de rolagem vertical em Flutter?

Use o widget `ListView`:

```dart
ListView(
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
)
```

---

## • Como posso adicionar itens dinamicamente a um `ListView`?

Use o `ListView.builder`:

```dart
ListView.builder(
  itemCount: itens.length,
  itemBuilder: (context, index) {
    return Text(itens[index]);
  },
)
```

---

## • Quais as diferenças entre `ListView.builder` e `ListView.separated`?

- `ListView.builder`: cria itens sob demanda.
- `ListView.separated`: permite adicionar separadores entre os itens.

---

## • Como posso usar `ListTile` para criar itens de lista em um `ListView`?

```dart
ListView(
  children: [
    ListTile(
      title: Text('Título'),
      subtitle: Text('Subtítulo'),
      leading: Icon(Icons.star),
      trailing: Icon(Icons.arrow_forward),
    ),
  ],
)
```

---

## • Como posso tornar os itens `ListTile` interativos (clicáveis)?

Utilize o parâmetro `onTap`:

```dart
ListTile(
  title: Text('Clicável'),
  onTap: () {
    print('Item clicado');
  },
)
```

---

## • Quais as vantagens de usar `ListTile` em vez de widgets de texto simples?

- Layout pré-definido com ícone, título, subtítulo e ação.
- Economia de código.
- Fácil integração com listas interativas.

---
