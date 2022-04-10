import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/currency/currency.dart';

class ApiCurrency {
  Future<List<Currency>> getCurrencies(
      String currency, List<String> currencyIn) async {
    final List currenciesCode = [];
    final List listCurrencies = [];

    for (var element in currencyIn) {
      currenciesCode.add('$element-$currency');
    }

    final suffixUrl = currenciesCode.join(',');

    final url = Uri.parse('https://economia.awesomeapi.com.br/last/$suffixUrl');

    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        json.forEach((k, v) => listCurrencies.add(v));

        return listCurrencies
            .map<Currency>((currencyMap) => Currency.fromJson(currencyMap))
            .toList();
      } else if (response.statusCode == 404) {
        return [];
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
