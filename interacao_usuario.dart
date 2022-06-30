import 'dart:io';

class InteracaoUsuario {
  //Aqui vamos chamar para ler o nome do jogador. Lembrando da nossa dica de ouro de por um ! readLineSync
// e não deixar-lo nulopara garantir que não vai dar erro
  static String getPlayerName() {
    print("Bem vindo ao nosso jogo de pedra papel tesoura");
    print("Eu sou seu oponente hoje, meu nome é Severino");
    print("Primeiramente eu preciso saber seu nome");
    final nome = stdin.readLineSync()!;
    return nome;
  }

  static String getPlayerMov() {
    print("Para selecionar tesoura é só digitar %");
    print("Para selecionar pedra é só digitar *");
    print("Para selecionar papel é só digitar #");
    String movPlayer = stdin.readLineSync()!;
    return movPlayer;
  }
}
