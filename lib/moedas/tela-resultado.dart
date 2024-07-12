import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final double valorConvertido;

  const Resultado({super.key, required this.valorConvertido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: const Text("Resultado"),
        backgroundColor: const Color(0xFF87CEFA),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valor Convertido: $valorConvertido"),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF87CEFA)
                    ),
                    child: const Text("Voltar"),
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
              icon: const Icon(Icons.monetization_on),
              onPressed: () {
                Navigator.pushNamed(context, '/tela-escolha'); // Navegar para a tela de escolha de moedas
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
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
