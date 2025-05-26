# Persistência de Dados e Shared Preferences no Flutter

## O que é persistência de dados em aplicativos Flutter e por que é importante?

A persistência de dados permite que as informações do usuário ou do aplicativo sejam salvas mesmo após o fechamento do app. Isso é importante para manter configurações, preferências e informações que não devem ser perdidas entre sessões.

## Quais são os diferentes tipos de dados que podem ser persistidos em um aplicativo Flutter?

* Dados simples (strings, números, booleanos): `SharedPreferences`
* Arquivos locais: usando `dart:io` com `File`
* Bancos de dados locais: como `sqflite` ou `Drift`
* Armazenamento seguro: como `flutter_secure_storage`
* Armazenamento na nuvem: como Firebase, Supabase etc.

## O que é o pacote SharedPreferences em Flutter e como ele funciona?

`SharedPreferences` é um pacote que fornece uma maneira simples de armazenar dados primitivos (int, double, bool, string e listas de strings) de forma persistente, como se fosse um dicionário de chave-valor. Os dados são armazenados localmente no dispositivo e lidos de forma assíncrona.

### Exemplo de uso:

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setString('username', 'joao');
String? nome = prefs.getString('username');
```

## Quais são as limitações do SharedPreferences em termos de armazenamento de dados?

* Não é indicado para grandes quantidades de dados
* Apenas tipos primitivos são suportados
* Dados não são criptografados por padrão (não ideal para dados sensíveis)
* Pode ter performance ruim com escrita/leitura excessiva

## Quando devo usar SharedPreferences em vez de outras opções de persistência de dados?

Use SharedPreferences quando:

* Os dados são simples (preferências, configurações)
* Os dados não são sensíveis (sem necessidade de segurança avançada)
* A persistência precisa ser leve e rápida

Evite para:

* Armazenar listas complexas, objetos grandes ou estruturas aninhadas
* Armazenamento de arquivos ou imagens
* Dados sensíveis (como tokens, senhas)

## Como posso lidar com erros ao usar SharedPreferences?

* Use blocos `try-catch` ao acessar ou modificar dados
* Verifique se os valores são `null` antes de usá-los
* Evite operações simultâneas intensas que causem conflitos

### Exemplo:

```dart
try {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('modoEscuro', true);
} catch (e) {
  print('Erro ao salvar preferência: $e');
}
```

## Quais são as melhores práticas para usar SharedPreferences de forma eficiente?

* Crie uma classe utilitária para gerenciar as chaves e acessos
* Use constantes para as chaves
* Evite acessar diretamente em vários lugares diferentes do app
* Prefira carregar os dados uma vez (ex: na inicialização do app) e reutilizar no estado da aplicação

### Exemplo de classe utilitária:

```dart
class AppPreferences {
  static const _keyUsername = 'username';

  static Future<void> setUsername(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, name);
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }
}
```
