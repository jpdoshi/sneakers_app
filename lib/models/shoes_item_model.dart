import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sneakers_app/config.dart';

Future<List<dynamic>> getAllShoes() async {
  var result = await http.get(Uri.parse('$connectionUrl/shoes'));
  return jsonDecode(result.body);
}

Future<Map> getShoesById(String shoesId) async {
  var result = await http.get(Uri.parse('$connectionUrl/shoes/$shoesId'));
  return jsonDecode(result.body);
}

Future<List<dynamic>> getShoesSlider() async {
  var result = await http.post(Uri.parse('$connectionUrl/shoes/slider'));
  return jsonDecode(result.body);
}
