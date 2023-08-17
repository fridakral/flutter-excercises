

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/networking/coin_api.dart';

const apiKey = '192CEA59-DFCE-41FF-B1CA-FFD48EDC6257';
const apiUrl = 'rest.coinapi.io';
const apiMap = '/v1/exchangerate';

class ExchangeService{

  Future getExchangeRate(String currency) async{
    Map<String, String> cryptoPrices = {};

    for(String crypto in cryptoList){
      String map = '$apiMap/$crypto/$currency';
      var url = Uri.https(apiUrl, map, {'apikey': '$apiKey'});
      CoinAPI coinAPI = CoinAPI(url);
      var data = await coinAPI.getData();
      String value = '${double.parse(data['rate'].toString()).round()}';
      cryptoPrices[crypto]=value;

    }

    return cryptoPrices;
  }

}