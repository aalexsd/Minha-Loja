import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/result.pessoa.dart';

Future<bool> myLogin(login, senha) async {
  var data = {"email": login, "senha": senha};
  var data2 = json.encode(data);

  final response = await http.post(Uri.parse("http://localhost:8081/login"),
      body: data2, headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    user = ResultPessoa.fromJson(jsonDecode(response.body));
    if (user.id! > 0) {
      return true;
    } else
      return false;
  } else {
    return false;
  }
}
