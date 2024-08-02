import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sneakers_app/config.dart';

Future<dynamic> loginUser(String email, String password) async {
  var result = await http.post(
      Uri.parse('$connectionUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password
      })
  );

  if (result.statusCode == 200) {
    return jsonDecode(result.body);
  } else {
    return result.body;
  }
}

Future<dynamic> signUpUser(String email, String password) async {
  var result = await http.post(
      Uri.parse('$connectionUrl/user/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password
      })
  );

  if (result.statusCode == 200) {
    return jsonDecode(result.body);
  } else {
    return result.body;
  }
}
