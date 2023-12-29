import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testes/bloc/wsf_param.dart';

class API {
  
static Future<bool> cadUsuario(usuario) async {

    var data = {
      "nome": usuario.nome,
      "sobrenome": usuario.sobrenome,
      "cpf": usuario.cpf,
      "email": usuario.email,
      "cel": usuario.celular,
      "nasc": usuario.nasc,
      "sexo": usuario.sexo,
      "senha": usuario.senha,
      "cep": usuario.cep,
      "endereco": usuario.endereco,
      "nro": (usuario.numero == null) ? "0" : usuario.numero.toString(),
      "complemento": (usuario.complemento == null) ? "" : usuario.complemento.toString(),
      "bairro": usuario.bairro,
      "cidade": usuario.cidade,
      "uf": usuario.uf,
    };
    print(data);

    var data2 = json.encode(data);

    final response = await http.post(Uri.parse(Wsf().baseurl() + 'cadastro'), body: data2, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return true;
    } else
      return false;
  }
}