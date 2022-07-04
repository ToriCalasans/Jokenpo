// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jokenpo/core/rules/empatar.dart';
import 'package:jokenpo/core/rules/regra.dart';
import 'package:jokenpo/core/rules/vencer.dart';

import 'player.dart';

import 'status_jogo.dart';

//Aqui temos a classe do jogo com a "planta baixa" do que temos criar, os atributos. E Claro a lista de regras que vai ser usada no noss applyRules
class Jogo {
  int partidas;
  int derrotas;
  int vitorias;
  int empates;
  List<Regra> regras = [];
  late String jogada1;
  late String jogada2;
/*
Quando dentro da classe o this nada mais é do que uma referência da própria classe dentro de funções ou métodos.
Para referenciar atributos ou funções da própria classe dentro de outras funções da mesma classe.
Quando precisa-se invocar ou pegar valores de atributos ou funções da própria classe.
O uso do this é opcional em Dart, mas deve ser utilizado obrigatoriamente quando nos construtores.
um construtor serve para quando chamado durante a criação do objeto de uma determinada classe, 
podemos passar parâmetros para a classe e executar determinadas validações ou funções dentro desse contexto.
*/
  Jogo({
    this.partidas = 0,
    this.derrotas = 0,
    this.vitorias = 0,
    this.empates = 0,
  });
// Classes sem retorno são chamadas de void, que quer dizer vazio ( lembre-se da Herrscher of void, honkai impact)
  void run(Player jogador, Player severino) {
    while (true) {
      final movJogador = jogador.jogar();
      final movSeverino = severino.jogar();
      iniciar(movJogador, movSeverino);
    }
  }

/*
Aqui onde nós iniciamos o jogo. Primeiro, como estamos chamando o módulo principal,
onde o jogo vai ser executado, ele não precisa retornar nada. Primeiro ele vai chamar a jogada do jogador
e da máquina e chamar também as regras dele. 

*/
  StatusJogo iniciar(String jogada1, String jogada2) {
    this.jogada1 = jogada1;
    this.jogada2 = jogada2;

    regras = [
      Empatar(jogo: this),
      Vencer(jogo: this),
    ];
//Aqui vamos comprar os status que recebemos de aplicar regras (lembre-se daquela lista enum que define quem ganhou ou perdeu [alou Dilma])
    final status = _applyRules();
    switch (status) {
      //caso StatusJogo.Empate ele conta mais 1 no contador. Isso se repete para os outros.
      case StatusJogo.Empate:
        empates++;
        print("Empatou");
        break;
      case StatusJogo.Vitoria:
        vitorias++;
        //aqui nós também definimos qual jogador venceu
        // print("${this.jogador.nome} venceu");
        break;
      case StatusJogo.Derrota:
        derrotas++;
        // print("${this.severino.nome} venceu");
        break;
      default:
    }
    partidas++;
//
    print(this);

    return status;
  }

/*Aqui sobrescresvemos nosso placar. 
Uma coisa legal é que blocos de textos grande são escritos com um '''texto''' assim podemos fazer nosso placar.
lembre-se de colocar o toSring para representar em string o objeto.
*/
  @override
  String toString() {
    return '''
    -----------------------------------------------
    |                Nosso Placar:                |
    |            Nós Jogamos $partidas partidas   |
    |         Com $vitorias vitorias suas         |
    |       Com $empates terminadas em empates    |
    |          Com $derrotas derrotas suas        |
    -----------------------------------------------
    ''';
  }

//Aqui vamos chamar para ler o nome do jogador. Lembrando da nossa dica de ouro de por um ! readLineSync
// e não deixar-lo nulopara garantir que não vai dar erro

  /* 
  Aqui vamos aplicar as regras
  O for vai pegar regras e instânciar as regras de StatusJogo 
  resultado vai receber regra.aplicar() que é uma chamada da lista de regras.
  se o resultado da regra não for nulo então vai retornar o resultado chamando a regra que solicitamos.
  como disse antes applyRules serve para deixar o jogo genérico.Isso possíbilita de criar várias fases com regras diferentes.

  */
  StatusJogo _applyRules() {
    for (var regra in this.regras) {
      final resultado = regra.aplicar();
      if (resultado != null) {
        return resultado;
      }
    }
    return StatusJogo.Derrota;
  }
}
