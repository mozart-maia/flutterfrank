import 'package:conversor/moedas/splash.dart';
import 'package:conversor/moedas/tela-moedas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tela de splash como primeira tela
      home: const SplashScreen(),
      // rotas
      routes: {
        '/tela-escolha': (context) => const TelaEscolha(),
      },
    );
  }
}
