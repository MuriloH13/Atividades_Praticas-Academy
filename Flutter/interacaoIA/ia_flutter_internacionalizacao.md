# Internacionalização em Flutter

## O que é internacionalização e qual sua importância?

Internacionalização (i18n) é o processo de preparar um aplicativo para que ele suporte vários idiomas e culturas. A importância da internacionalização está em permitir que usuários de diferentes regiões e línguas tenham uma experiência de uso mais natural, acessível e confortável.

## Como funciona a internacionalização no Flutter?

O Flutter possui suporte integrado para internacionalização por meio do pacote `flutter_localizations` e da biblioteca `intl`. A abordagem mais comum usa arquivos `.arb` (Application Resource Bundle) para armazenar as strings traduzidas e `Intl.message` para definir as mensagens no código Dart.

Passos básicos:

1. Adicionar o pacote `flutter_localizations` no `pubspec.yaml`.
2. Criar os arquivos `.arb` com traduções.
3. Usar o comando `flutter gen-l10n` para gerar as classes de localização.
4. Configurar os delegates e locais suportados em `MaterialApp`.

## Dicas de uso dos arquivos ARB

* Os arquivos `.arb` devem ser nomeados conforme o idioma, por exemplo: `app_en.arb`, `app_pt.arb`.
* Utilize o campo `@<message>` para definir descrições e exemplos de uso, facilitando a tradução.
* Mantenha uma estrutura consistente entre os arquivos para evitar problemas de compilação.
* Não insira lógica nos arquivos `.arb`, apenas texto e placeholders.

Exemplo:

```json
{
  "hello": "Olá",
  "@hello": {
    "description": "Mensagem de saudação",
    "type": "text"
  }
}
```

## Cuidados ao usar o pacote INTL

* Sempre use `Intl.message()` ao definir strings no código para garantir que possam ser extraídas.
* Evite mensagens dinâmicas ou montadas em tempo de execução, pois dificultam a tradução.
* Lembre-se de tratar corretamente plurais e variáveis com o uso de `Intl.plural` ou `Intl.gender` quando necessário.

## Como adicionar suporte para diferentes idiomas em meu aplicativo Flutter?

1. Adicione as dependências no `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.18.0
```

2. Configure o `MaterialApp`:

```dart
MaterialApp(
  localizationsDelegates: [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('en'),
    Locale('pt'),
  ],
)
```

3. Crie os arquivos `.arb` na pasta `lib/l10n` e rode:

```bash
flutter gen-l10n
```

4. Utilize as traduções no código:

```dart
Text(AppLocalizations.of(context)!.hello)
```

A internacionalização melhora significativamente a experiência do usuário e é essencial para apps que desejam alcançar um público global.
