class ConversaoMoeda {
  static double converterMoeda(double valor, String moedaOrigem,
      String moedaDestino) {
    // taxas de conversão para cada moeda
    Map<String, double> taxasDeConversao = {
      'USD': 5.0, // Dólar Americano
      'EUR': 6.0, // Euro
      'BRL': 1.0, // Real Brasileiro
    };

    // Verificar se as moedas de origem e destino são válidas
    if (taxasDeConversao.containsKey(moedaOrigem) &&
        taxasDeConversao.containsKey(moedaDestino)) {
      // Realize a conversão
      double taxaOrigem = taxasDeConversao[moedaOrigem]!;
      double taxaDestino = taxasDeConversao[moedaDestino]!;
      double resultado = (valor / taxaOrigem) * taxaDestino;
      // Arredonda o resultado para duas casas decimais
      resultado = double.parse(resultado.toStringAsFixed(2));
      return resultado;
    } else {
      // Moedas inválidas - lançar uma exceção
      throw Exception('Moedas inválidas: $moedaOrigem para $moedaDestino');
    }
  }
}
