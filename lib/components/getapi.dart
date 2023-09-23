import 'dart:convert';

import 'package:http/http.dart' as http;

Future getApi() async {
  var url = Uri.parse('https://weather.contrateumdev.com.br/api/weather/city/?city=palhoca');
  var response = await http.get(url);
  var data = await jsonDecode(response.body);
  return data['name'];

}