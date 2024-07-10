import 'package:conversor/moedas/splash.dart';
import 'package:conversor/moedas/tela-moedas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tela de splash como primeira tela
      home: SplashScreen(),
      // rotas
      routes: {
        '/tela-escolha': (context) => TelaEscolha(),
      },
    );
  }
}
