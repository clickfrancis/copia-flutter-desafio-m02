enum CurrencyType {
  // Real(BRL), Libra Esterlina(GBP), Dólar Americano(USD), Peso Argentino(ARS) e Iene(JPY);
  brl,
  usd,
  gbp,
  jpy,
  ars,
}

extension CurrencyTypeName on CurrencyType {
  static String toCurrency(String currencies) {
    switch (currencies) {
      case 'brl':
        return 'Real';
      case 'gbp':
        return 'Libra Esterlina';
      case 'usd':
        return 'Dólar Americano';
      case 'ars':
        return 'Peso Argentino';
      default:
        return 'Iene';
    }
  }
}

class CurrencyCode {
  static String toCurrency(String currencies) {
    switch (currencies) {
      case 'BRL':
        return 'Real';
      case 'GBP':
        return 'Libra Esterlina';
      case 'USD':
        return 'Dólar Americano';
      case 'ARS':
        return 'Peso Argentino';
      default:
        return 'Iene';
    }
  }
}
