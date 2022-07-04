import '../jogo.dart';
import 'regra.dart';
import '../status_jogo.dart';

class Empatar extends Regra {
  final Jogo jogo;
  Empatar({
    required this.jogo,
  });

  @override
  StatusJogo? aplicar() {
    if (jogo.jogada1 == jogo.jogada2) {
      return StatusJogo.Empate;
    }

    return null;
  }
}
