# Boas Práticas na Declaração de Variáveis em Dart

## Quais as boas práticas em Dart ao declarar variáveis?

### 1. Use `final` e `const` sempre que possível
Evite `var` e `dynamic` quando o valor não muda.

- **`final`**: para valores que são definidos apenas uma vez (tempo de execução).
- **`const`**: para valores que nunca mudam (tempo de compilação).

### 2. Prefira tipos explícitos quando possível
Usar tipos explícitos melhora a legibilidade e ajuda a evitar erros. Ainda assim, `var` pode ser usado quando o tipo é óbvio pelo valor atribuído.

### 3. Evite `dynamic` quando possível
O tipo `dynamic` desativa a verificação de tipo, o que pode levar a erros difíceis de depurar. Prefira usar tipos específicos ou `Object?` se precisar armazenar qualquer valor.

### 4. Use `late` apenas quando necessário
`late` pode ser útil para inicialização tardia, mas evite seu uso excessivo.

---

## O que evitar na hora de declarar variáveis em Dart?

1. **Usar `var` ou `dynamic` sem necessidade**
2. **Declarar variáveis sem necessidade**
3. **Não usar `final` e `const` para valores imutáveis**
4. **Nomes de variáveis pouco descritivos**
5. **Declarar variáveis `late` sem necessidade**
6. **Não usar `?` para valores nulos quando necessário**
7. **Usar listas e mapas mutáveis quando não precisa**

---

## Cuidados ao trabalhar com valores nulos em Dart

### 1. Use `?` para permitir valores nulos
Uma variável pode ser **nullable** (`?`) ou **non-nullable**. Para permitir `null`, use `?` ao declarar a variável.

### 2. Verifique se a variável não é `null` antes de usá-la
Use `if`, `?.` ou `??` para evitar erros de acesso.

### 3. Evite `late` sem necessidade
Se não for inicializada antes do uso, causará erro.

### 4. Converta `null` para um valor padrão com `??`

### 5. Utilize `!` apenas quando tiver certeza de que não é `null`
O operador `!` pode quebrar o programa caso a variável seja realmente `null`.

### 6. Inicialize variáveis nullable com valores padrão sempre que possível

### 7. Use `required` para parâmetros obrigatórios

---

## Quando usar `?` e quando usar `late`?

### Quando usar `?`
- Quando o valor pode ser `null` em algum momento do código.

### Quando usar `late`?
- Quando a variável será inicializada mais tarde, mas sempre antes de ser usada.

---

## Benefícios do modificador `late`

1. Evita valores `null` sem precisar de `?`
2. Inicialização eficiente e mais rápida
3. Permite variáveis obrigatórias em classes sem `null`
4. Útil para injeção de dependência
5. Evita inicializações desnecessárias

---

## Diferenças entre `final` e `const`

| Característica | `final` | `const` |
|--------------|--------|--------|
| Tempo de definição | Execução | Compilação |
| Imutável | Sim | Sim |
| Pode receber valores dinâmicos | Sim | Não |
| Melhor otimização de memória | Não | Sim |

Use `final` quando o valor for definido em tempo de execução.
Use `const` quando o valor for fixo e conhecido na compilação.

---

## Por que usar `final` e `const` ao invés de valores padrão?

1. Evita valores mágicos e melhora a legibilidade
2. Evita repetições e facilita a manutenção
3. Melhora o desempenho e reduz o consumo de memória
4. Garante imutabilidade e segurança no código

---

## Métodos de variáveis `String` no Dart

### Manipulação de Texto
- `toUpperCase()` – Converte para maiúsculas
- `toLowerCase()` – Converte para minúsculas
- `trim()` – Remove espaços extras
- `replaceAll(String antiga, String nova)` – Substitui todas as ocorrências

### Busca
- `contains(String substring)` – Verifica se contém um texto
- `indexOf(String substring)` – Retorna a posição da primeira ocorrência

### Extração e Divisão
- `substring(int inicio, [int fim])` – Retorna parte da string
- `split(String delimitador)` – Divide uma string em uma lista

### Verificação
- `startsWith(String prefixo)` – Verifica se começa com um texto
- `isEmpty` – Verifica se a string está vazia

### Formatação
- `padLeft(int comprimento, [String preenchimento])` – Preenche à esquerda
- `padRight(int comprimento, [String preenchimento])` – Preenche à direita

### Conversão
- `toString()` – Converte qualquer valor para string

---

## Métodos da classe `int`

- `abs()` – Retorna o valor absoluto
- `ceil()` – Arredonda para cima
- `floor()` – Arredonda para baixo
- `round()` – Arredonda para o inteiro mais próximo
- `toDouble()` – Converte para `double`
- `toString()` – Converte para `String`
- `isEven` – Verifica se é par
- `isOdd` – Verifica se é ímpar
- `gcd(int other)` – Calcula o maior divisor comum (MDC)
- `toRadixString(int radix)` – Converte para string em outra base numérica

---