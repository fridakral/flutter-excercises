import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

  final Uri weathetUrl;

  NetworkHelper(this.weathetUrl);

  Future getData() async{

    var res = await http.get(weathetUrl);
    if(res.statusCode==200){
      String data = res.body;
      return jsonDecode(data);
    }else{
      print(res.statusCode);
    }
  }

}