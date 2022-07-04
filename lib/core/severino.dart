
import 'dart:math';

import 'player.dart';

class Severino extends Player {
  Severino() : super(nome: "Severino");

  String jogar() {
    final severino = Random();
    final jogadas = ["*", "#", "%"];
    final jogada = jogadas[severino.nextInt(3)];
    print("Severino invoca $jogada no campo de batalha");
    return jogada;
  }
}
//pobre severino foi desusado. 
