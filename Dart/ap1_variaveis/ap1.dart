void main() {
  String nome = "Murilo";
  String sobrenome = "Branco";
  int idade = 19;
  bool ativo = true;
  double peso = 76.5;
  String? nacionalidade = "Brasileiro";

  print("Nome completo: $nome $sobrenome");
  print("Idade: $idade ${idade >= 18 ? "(maior" : "(menor"} de idade)");
  print("Situação: ${ativo ? "Ativo" : "Inativo"}");
  print("Peso: $peso");
  print("Nacionalidade: ${nacionalidade ?? "Não informada"}");
}
