import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../network/api_configuration.dart';
class NetworkHelper  {
  NetworkHelper(this.myurl);
  final String myurl;


  Future getData ()  async{
    var url = Uri.parse(myurl);


    Response response = await http.get(Uri.parse(myurl));

    if(response.statusCode == 200)
    {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }else
    {
      return response.statusCode;
    }
  }



}