import 'package:conversor/moedas/conversao-moeda.dart';
import 'package:conversor/moedas/tela-resultado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Pacote para utilizar o TextInputFormatter

class TelaEscolha extends StatefulWidget {
  const TelaEscolha({super.key});

  @override
  _TelaEscolhaState createState() => _TelaEscolhaState();
}

class _TelaEscolhaState extends State<TelaEscolha> {
  TextEditingController valorController = TextEditingController();
  String moedaOrigem = "BRL"; // Moeda de origem padrão
  String moedaDestino = "USD"; // Moeda de destino padrão

  bool hasError = false;
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
          title: const Text("Conversor de Moedas"),
          backgroundColor: const Color(0xFF87CEFA),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: valorController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                // Permite apenas números e até duas casas decimais
                decoration: const InputDecoration(labelText: "Valor"),
              ),
              const SizedBox(height: 20), // Espaçamento
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("De", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(child: Text('USD'), ),
                  DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                  DropdownMenuItem(value: "BRL", child: Text('BRL')),
                ],
                onChanged: (newValue) {
                  setState(() {
                    moedaOrigem = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20), // Espaçamento
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // ação para o botão de troca de moeda
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF87CEFA)
                      ),
                      child: const Text("Trocar Moedas"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espaçamento
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Para", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(child: Text('EUR'), ),
                  DropdownMenuItem(value: 'USD', child: Text('USD')),
                  DropdownMenuItem(value: 'BRL', child: Text('BRL')),
                ],
                onChanged: (newValue) {
                  setState(() {
                    moedaDestino = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20), // Espaçamento
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        // Para o botão de conversão
                        onPressed: () {
                          // Verificar se o campo de valor está vazio ou não é numérico
                          if (valorController.text.isEmpty || double.tryParse(valorController.text) == null) {
                            setState(() {
                              hasError = true;
                              // Mensagem de erro específica
                              errorMessage = "Por favor, forneça um valor numérico válido antes de converter.";
                              print(errorMessage);  // print para depuração
                            });
                          } else {
                            // Verificar se as moedas de origem e destino são diferentes
                            if (moedaOrigem == moedaDestino) {
                              setState(() {
                                hasError = true;
                                errorMessage = "Por favor, escolha moedas diferentes para conversão.";
                                print(errorMessage);  // print para depuração
                              });
                            } else {
                              // Resetar a variável de erro e realizar a conversão
                              setState(() {
                                hasError = false;
                                errorMessage = "";
                              });
                              double valor = double.parse(valorController.text);
                              double resultado = ConversaoMoeda.converterMoeda(valor, moedaOrigem, moedaDestino);
                              print("Conversão realizada: $valor $moedaOrigem para $moedaDestino = $resultado");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Resultado(
                                    valorConvertido: resultado,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent, // Altere para a cor desejada
                        ),
                        child: const Text(
                            "Converter",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espaçamento
              // Exibir a mensagem de erro se houver
              if (hasError)
                const Text(
                  "Por favor, forneça um valor numérico antes de converter.",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
      // menu inferior
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.monetization_on),
              onPressed: () {
                Navigator.pushNamed(context, '/tela-escolha');
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
