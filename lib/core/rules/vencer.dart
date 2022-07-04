import 'package:jokenpo/core/jogo.dart';

import 'regra.dart';
import '../status_jogo.dart';

class Vencer extends Regra {
  final _jogadas = ["*", "#", "%"];

  final Jogo jogo;

  Vencer({required this.jogo});
  /*
  Aqui temos a lógica de vencer ou perder 
  indexOf pesquisa a lista do início do índice até o final da lista. 
  A primeira vez que um objeto X é encontrado para que o elemento X == elemento o índice de X é retornado.
  Depois de recebido os valores vamos comparar os valores. Caso indexPlayer for igual a 0 e nosso severino entrar na regra de 
  jogador == 0 e severino a 2 (Ex: Pedra é 0 e tesoura 2 e o jogador o severino escolheram esses respectivamente) o jogador ganha
  ou o indice da jogada do player é maior que o do severino. (Ex:papel é 1 e pedra 0, jogador o severino escolheram esses respectivamente) 
  */
  @override
  StatusJogo? aplicar() {
    final indexPlayer = _jogadas.indexOf(jogo.jogada1);
    final indexSeverino = _jogadas.indexOf(jogo.jogada2);

    if ((indexPlayer + 1) % 3 == indexSeverino) {
      return StatusJogo.Derrota;
    }
    return StatusJogo.Vitoria;
  }
}
