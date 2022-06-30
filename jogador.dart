import 'player.dart';

class Jogador extends Player {
  final String Function() jogada;

  Jogador({
    required this.jogada,
    required nome,
  }) : super(nome: nome);
/*
Aqui vamos para o primeiro comportamento, ou seja a função. Nosso caso abaixo, jogada vai pedir o movimento do jogador. 
Uma dica aqui é, readLineSync só aceita strings, só que a forma como estamso fazendo ela pode aceitar nulo ou string. Isso faz o SYNC pirar.
Para que tudo esteja certo, vamos dizer para ele que vamos garantir que não vai ter valores nulos colocando um! no final "stdin.readLineSync()!"
E finalizar retornando o movPlayer. Nota para o stdin.readLineSync() funcionar precisamos da biblioteca import "'dart:io';", só colocar lá em cima ou apertar a lampada quando colocar o Sync
*/
  String jogar() {
    return jogada();
  }
}
