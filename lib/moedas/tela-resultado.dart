import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final double valorConvertido;

  Resultado({required this.valorConvertido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text("Resultado"),
        backgroundColor: Color(0xFF87CEFA),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valor Convertido: $valorConvertido"),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF87CEFA)
                    ),
                    child: Text("Voltar"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.monetization_on),
              onPressed: () {
                Navigator.pushNamed(context, '/tela-escolha'); // Navegar para a tela de escolha de moedas
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // ação para o botão de configurações
              },
            ),
          ],
        ),
      ),
    );
  }
}
