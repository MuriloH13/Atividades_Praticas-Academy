# Guia sobre Funções em Dart

## Quais cuidados devo ter ao criar funções em Dart?

1. **Nome claro e descritivo:** Escolha nomes que expressem claramente a finalidade da função.
2. **Evite funções longas:** Mantenha suas funções curtas e focadas em uma única responsabilidade.
3. **Utilize tipos de retorno e parâmetros:** Evite o uso de `dynamic` quando possível.
4. **Prefira expressões lambda para funções curtas:** Torna o código mais legível.
5. **Use `final` para evitar modificações indesejadas:** Em parâmetros que não devem ser alterados.
6. **Documente suas funções:** Utilize `///` para descrição e explicar os parâmetros e retorno.

## Posso chamar minha função dentro dela mesma?

Sim, isso é chamado de **recursão**. No entanto, é importante definir uma condição de parada para evitar loops infinitos.

Exemplo:
```dart
int fatorial(int n) {
  if (n <= 1) return 1;
  return n * fatorial(n - 1);
}
```

## Existe limite de parâmetros a serem recebidos em uma função?

Não há um limite fixo, mas muitas funções com muitos parâmetros tornam o código menos legível e mais difícil de manter. O ideal é usar **parâmetros nomeados** ou um objeto para agrupar vários valores.

## É recomendado usar `dynamic` nos parâmetros de uma função?

Não é recomendado, pois **desativa a verificação de tipo** e pode causar erros em tempo de execução. Prefira usar tipos específicos ou `Object?` caso precise armazenar qualquer valor.

## Quando usar os operadores de valores opcionais e valores requeridos em uma função Dart?

- **Valores opcionais (`[]`)**: Usados quando um parâmetro pode ser omitido.
- **Valores requeridos (`required`)**: Utilizados quando um parâmetro deve ser obrigatoriamente informado.

Exemplo:
```dart
void mostrarMensagem({required String mensagem, String? autor}) {
  print('Mensagem: $mensagem');
  if (autor != null) {
    print('Autor: $autor');
  }
}
```

## O que são parâmetros nomeados em uma função?

São parâmetros passados **por nome**, tornando chamadas de funções mais claras e flexíveis. Eles são declarados entre `{}`.

Exemplo:
```dart
void saudar({required String nome, String mensagem = "Olá"}) {
  print('$mensagem, $nome!');
}

saudar(nome: "Carlos"); // Olá, Carlos!
saudar(nome: "Ana", mensagem: "Bom dia"); // Bom dia, Ana!
```

## Quais métodos existem para variáveis do tipo Function em Dart?

- **call()**: Chama a função armazenada em uma variável.
- **toString()**: Retorna uma representação em string da função.
- **hashCode**: Retorna um código hash da função.

Exemplo:
```dart
void minhaFuncao() {
  print("Executando minhaFunção");
}

Function f = minhaFuncao;
print(f.toString());
```

## Qual a diferença entre chamar minha função `olaMundo` das seguintes formas `olaMundo` e `olaMundo()`?

- `olaMundo` (sem `()`) refere-se **à própria função**, sem executá-la. Pode ser usada para armazená-la em uma variável.
- `olaMundo()` chama a função e executa seu código.

Exemplo:
```dart
void olaMundo() {
  print("Olá, Mundo!");
}

Function f = olaMundo; // Apenas referencia a função, sem executá-la
f(); // Agora sim, executa olaMundo()
```

