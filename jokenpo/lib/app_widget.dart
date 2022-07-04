import 'package:flutter/material.dart';
import 'package:jokenpo/pages/escolha_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EscolhaPage(title: 'Flutter Demo Home Page'),
    );
  }
}
