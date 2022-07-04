import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/pages/diputa_page.dart';

import '../core/jogo.dart';

class EscolhaPage extends StatefulWidget {
  const EscolhaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EscolhaPage> createState() => _EscolhaPageState();
}

class _EscolhaPageState extends State<EscolhaPage> {
  late Jogo jogo;

  double imageSize = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Jokenpo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: const JokenpoOption(
                asset: 'assets/pedra.png',
                symbol: "*",
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: const JokenpoOption(
                asset: 'assets/papel.png',
                symbol: "#",
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: const JokenpoOption(
                asset: 'assets/tesoura.png',
                symbol: "%",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JokenpoOption extends StatelessWidget {
  const JokenpoOption({
    Key? key,
    required this.asset,
    required this.symbol,
  }) : super(key: key);

  final String asset;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DisputaPage(assetPlayer: asset, symbolPlayer: symbol);
          },
        ));
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Transform(
          transform: Matrix4.rotationY(pi),
          origin: const Offset(180 / 2, 0),
          child: Image.asset(
            asset,
            width: 225,
            height: 120,
          ),
        ),
      ),
    );
  }
}
