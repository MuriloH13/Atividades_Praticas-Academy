
# 📘 InteraçãoIA-Flutter – Navegação com Rotas

---

## • O que são rotas anônimas em Flutter e como elas funcionam?

Rotas anônimas são criadas diretamente com `Navigator.push` usando widgets ao invés de nomes. São úteis para navegação simples e rápida.

---

## • Quais métodos do Navigator são comumente utilizados e por quê?

- `Navigator.push`: empilha uma nova rota.
- `Navigator.pop`: remove a rota atual.
- `Navigator.pushReplacement`: substitui a rota atual.
- `Navigator.pushNamed`: navega para uma rota nomeada.
- `Navigator.popUntil`: volta até uma rota específica.

Esses métodos ajudam a controlar o histórico de navegação do app.

---

## • Qual a função do `Navigator.push()` na navegação com rotas anônimas?

Ele empilha uma nova rota na pilha de navegação:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SegundaTela()),
);
```

---

## • Quais as vantagens e desvantagens de usar rotas anônimas?

**Vantagens:**
- Simples e direta para poucas telas.
- Rápido para prototipagem.

**Desvantagens:**
- Dificulta a manutenção em projetos grandes.
- Reutilização e testes ficam mais difíceis.

---

## • O que são rotas nomeadas em Flutter e como elas funcionam?

Rotas nomeadas utilizam uma chave de string para identificar cada tela. São definidas no `MaterialApp` via `routes`.

---

## • Como posso navegar para uma rota nomeada específica?

```dart
Navigator.pushNamed(context, '/segundaTela');
```

---

## • Quais as vantagens de usar rotas nomeadas em relação às rotas anônimas?

- Código mais limpo.
- Facilita manutenção.
- Permite centralizar a definição de todas as rotas.
- Melhor suporte a deep linking.

---

## • Como posso definir rotas nomeadas em meu aplicativo Flutter?

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => TelaInicial(),
    '/segundaTela': (context) => SegundaTela(),
  },
)
```

---

## • Como posso acessar os parâmetros passados em uma rota nomeada?

```dart
// Ao navegar
Navigator.pushNamed(
  context,
  '/detalhes',
  arguments: 'Olá, parâmetro!',
);

// Ao acessar
final args = ModalRoute.of(context)!.settings.arguments as String;
```

---

## • Como posso tornar os parâmetros opcionais em uma rota nomeada?

Use `arguments` com verificação nula:

```dart
final args = ModalRoute.of(context)!.settings.arguments as String?;
```

---

## • Quais cuidados devo ter ao usar as rotas?

- Evite rotas com nomes duplicados.
- Trate argumentos ausentes ou inválidos.
- Evite empilhar muitas rotas desnecessárias.

---

## • Quais as boas práticas ao usar rotas em Flutter?

- Centralize a definição das rotas.
- Use constantes para os nomes.
- Prefira rotas nomeadas para grandes projetos.
- Documente os parâmetros esperados por cada rota.

---
