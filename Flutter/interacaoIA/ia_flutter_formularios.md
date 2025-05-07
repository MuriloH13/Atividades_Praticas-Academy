
# 📘 InteraçãoIA-Flutter – Formulários, Validações e Seleções

---

## • O que é um widget `TextField` em Flutter e para que ele serve?

O `TextField` é um widget usado para entrada de texto. Ele permite que o usuário digite informações, como nome, e-mail, senha etc.

---

## • Como posso obter o valor digitado pelo usuário em um `TextField`?

Através de um `TextEditingController`:

```dart
final controller = TextEditingController();

TextField(controller: controller)

// Depois, para acessar:
String texto = controller.text;
```

---

## • Qual a diferença entre um `TextField` e um `TextFormField`?

- `TextField`: entrada básica de texto.
- `TextFormField`: ideal para uso com formulários; permite validação, integração com `Form`, etc.

---

## • Quais parâmetros importantes do `TextField`?

- `controller`: controla o texto.
- `decoration`: personaliza o campo com rótulo, ícones, borda.
- `keyboardType`: tipo de teclado.
- `obscureText`: esconde texto (senha).
- `onChanged`: callback para mudanças de texto.

---

## • O que significa validar um campo de texto em Flutter?

É verificar se o conteúdo está correto, como se um campo de e-mail tem um “@” ou se uma senha possui pelo menos 8 caracteres.

---

## • Qual a diferença entre validação síncrona e assíncrona?

- **Síncrona**: executa instantaneamente (ex: campo vazio).
- **Assíncrona**: precisa de tempo ou conexão (ex: checar se e-mail já existe no servidor).

---

## • O que é um widget `CheckBox` em Flutter e para que ele serve?

O `Checkbox` permite seleção binária (sim/não, verdadeiro/falso). Muito usado para aceitar termos, selecionar opções etc.

```dart
Checkbox(
  value: isChecked,
  onChanged: (bool? newValue) {
    setState(() {
      isChecked = newValue!;
    });
  },
)
```

---

## • Como posso alterar a cor e a forma de um `CheckBox`?

Use os parâmetros:

```dart
Checkbox(
  activeColor: Colors.green,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  value: isChecked,
  onChanged: (val) {},
)
```

---

## • O que é um widget `Radio` em Flutter e qual sua aplicabilidade?

O `Radio` permite selecionar apenas uma opção de um grupo. É usado quando só se pode escolher uma opção entre várias.

---

## • Como posso alterar a cor e a forma de um `Radio`?

```dart
Radio(
  value: 1,
  groupValue: selectedValue,
  activeColor: Colors.blue,
  fillColor: MaterialStateProperty.all(Colors.purple),
  onChanged: (val) {
    setState(() {
      selectedValue = val!;
    });
  },
)
```

---
