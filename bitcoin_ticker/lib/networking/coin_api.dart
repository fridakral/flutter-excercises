import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinAPI{

  final Uri coinUrl;

  CoinAPI(this.coinUrl);

  Future getData() async {
    var res = await http.get(coinUrl);
    if(res.statusCode==200){
      String data = res.body;
      return jsonDecode(data);
    }
    else print(res.statusCode);
  }
}