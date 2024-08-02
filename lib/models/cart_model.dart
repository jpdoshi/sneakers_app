import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sneakers_app/config.dart';

Future<dynamic> getAllCartItems(String userId) async {
  var result = await http.get(
      Uri.parse('$connectionUrl/carts?userId=$userId')
  );

  if (result.statusCode == 200) {
    return jsonDecode(result.body);
  } else {
    return result.body;
  }
}
