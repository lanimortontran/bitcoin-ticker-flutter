import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

const List<String> currenciesList = ['AUD', 'BRL', 'CAD', 'CNY', 'EUR', 'GBP', 'HKD', 'IDR', 'ILS', 'INR', 'JPY', 'MXN', 'NOK', 'NZD', 'PLN', 'RON', 'RUB', 'SEK', 'SGD', 'USD', 'ZAR'];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<Map<String, dynamic>> getCoinData(String currency) async {
    Uri url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=48617A50-2B1C-45C7-9319-8CF60F3FF684');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      print(response.statusCode);
    }
  }
}
