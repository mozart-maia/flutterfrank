import 'dart:async';
import 'package:conversor/moedas/tela-moedas.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Tempo de exibição da tela de splash (por exemplo, 2 segundos)
    Timer(Duration(seconds: 3), () {
      // Navegar para a próxima tela após o tempo especificado, e desprezar a tela anterior
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TelaEscolha()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF87CEFA), // cor de fundo da tela
      body: Center(
        child: Image.network(
          'https://cdn.icon-icons.com/icons2/618/PNG/512/Currency_Conversion_icon-icons.com_56682.png',
          width: 150, // largura
          height: 150, // altura
        ),
      ),
    );
  }
}
