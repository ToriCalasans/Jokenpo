import 'regra.dart';
import 'status_jogo.dart';

class Empatar extends Regra {
  String jogada1;
  String jogada2;

  Empatar({
    required this.jogada1,
    required this.jogada2,
  });

  @override
  StatusJogo? aplicar() {
    if (jogada1 == jogada2) {
      return StatusJogo.Empate;
    }

    return null;
  }
}