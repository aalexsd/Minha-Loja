import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testes/bloc/wsf_param.dart';

import '../models/result.pessoa.dart';

Future<bool> myLogin(login, senha) async {
  var data = {"email": login, "senha": senha};
  var data2 = json.encode(data);

  final response = await http.post(Uri.parse(Wsf().baseurl() + 'login'),
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
