
# 📘 InteraçãoIA-Flutter – Conceitos Fundamentais

## • O que é o `MaterialApp` e seus parâmetros?

`MaterialApp` é um widget de alto nível do Flutter que configura e inicia uma aplicação baseada nos princípios do **Material Design**, fornecendo temas, navegação, localização e muito mais. Ele encapsula vários aspectos essenciais da interface do app.

### Principais parâmetros:
- `home`: define o widget inicial da aplicação.
- `routes`: mapa de rotas nomeadas para navegação.
- `initialRoute`: define qual rota será exibida primeiro.
- `theme`: define o tema da aplicação (cores, fontes, etc.).
- `darkTheme`: define um tema escuro alternativo.
- `themeMode`: define quando usar `theme` ou `darkTheme`.
- `debugShowCheckedModeBanner`: mostra ou oculta o selo "DEBUG".
- `title`: define o título do app (útil para tarefas como multitarefa).

---

## • Quais parâmetros são importantes no `MaterialApp`?

Os mais usados e importantes incluem:
- `home`
- `routes`
- `initialRoute`
- `theme` / `darkTheme` / `themeMode`
- `navigatorKey` (para controle de navegação global)
- `locale` / `supportedLocales` (para internacionalização)

---

## • Como funcionam os `import's` no Flutter?

Os `import` no Flutter funcionam como em outras linguagens baseadas em Dart. Eles são usados para acessar bibliotecas, arquivos locais ou pacotes externos.

Exemplos:
```dart
import 'package:flutter/material.dart'; // pacote padrão do Flutter
import 'meu_arquivo.dart';              // arquivo local
import 'package:http/http.dart';        // pacote externo
```

---

## • O que é o Material Design e como ele é utilizado no Flutter?

**Material Design** é um sistema de design criado pelo Google que oferece diretrizes para layouts, animações e componentes visuais modernos e acessíveis.

No Flutter, o Material Design é incorporado por meio de widgets prontos como:
- `AppBar`, `Scaffold`, `FloatingActionButton`, `Drawer`, `SnackBar` etc.
  Ele garante consistência visual e responsividade entre plataformas.

---

## • Principais widgets do Material Design no Flutter:

- `Scaffold`: estrutura básica de tela.
- `AppBar`: barra superior da aplicação.
- `TextField`: entrada de texto.
- `ElevatedButton`, `TextButton`, `IconButton`: botões.
- `Drawer`: menu lateral.
- `SnackBar`: mensagens temporárias.
- `BottomNavigationBar`: navegação por abas.
- `Card`: layout visual com sombra.
- `FloatingActionButton`: botão de ação flutuante.

---

## • O que são widgets `Stateless` e quando utilizá-los?

Widgets **Stateless** são imutáveis. Eles não mantêm estado interno e são reconstruídos apenas quando seu pai os reconstrói.

**Use quando:**
- O conteúdo do widget não depende de interações do usuário ou mudanças de dados após a construção.
- Ex: botões, textos estáticos, ícones.

---

## • Ciclo de vida de um widget Stateless:

1. Construtor é chamado.
2. Método `build()` é executado e retorna a interface do widget.
3. Fim do ciclo — o widget não se atualiza por conta própria.

---

## • Limitações dos widgets Stateless:

- Não reagem a mudanças de estado internas.
- Para qualquer atualização visual, precisam ser reconstruídos externamente.
- Inadequados para UI que muda com interação ou entrada dinâmica.

---

## • O que são widgets `Stateful` e quando utilizá-los?

Widgets **Stateful** possuem um estado interno que pode ser alterado dinamicamente, causando reconstruções da UI.

**Use quando:**
- Há necessidade de armazenar e atualizar dados que afetam a interface.
- Ex: formulários, animações, contadores, switches.

---

## • Ciclo de vida de um widget Stateful:

1. `createState()` → cria o estado.
2. `initState()` → inicializações.
3. `build()` → construção da UI.
4. `setState()` → atualiza e reconstrói o widget.
5. `dispose()` → limpeza (ex: fechar streams, controllers).

---

## • Como o gerenciamento de estado é feito em widgets Stateful?

- Via método `setState(() { ... })`, que atualiza a UI com base em mudanças nos dados.
- A lógica de estado fica dentro da classe `State<T>`.

---

## • Como funciona o `setState` em Flutter?

O método `setState()`:
1. Marca o widget como "precisando ser reconstruído".
2. Executa a função fornecida para alterar o estado.
3. Chama `build()` novamente para refletir as alterações.

---

## • Cuidados com gerenciamento de estado:

- Evitar chamadas excessivas ao `setState`, pois impacta a performance.
- Utilizar corretamente `dispose()` para evitar vazamentos de memória.
- Manter o estado o mais localizado possível.
- Para apps maiores, considerar soluções como Provider, Riverpod, Bloc, etc.

---

## • Principais diferenças entre Stateless e Stateful:

| Característica     | Stateless                       | Stateful                            |
|--------------------|----------------------------------|-------------------------------------|
| Estado interno     | Não possui                      | Possui                              |
| Mutabilidade       | Imutável                        | Mutável                             |
| Método chave       | `build()`                       | `createState()`, `initState()`, `build()`, `setState()`, `dispose()` |
| Uso recomendado    | Conteúdo fixo/estático          | Conteúdo dinâmico/que muda         |
