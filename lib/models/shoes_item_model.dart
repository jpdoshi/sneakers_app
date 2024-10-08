import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sneakers_app/config.dart';

Future<List<dynamic>> getShoesByCategory(String category) async {
  var result = await http.post(Uri.parse('$connectionUrl/shoes/category/$category'));
  return jsonDecode(result.body);
}

Future<List<dynamic>> searchShoes(String query) async {
  var result = await http.post(Uri.parse('$connectionUrl/shoes/search/?q=$query'));
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
