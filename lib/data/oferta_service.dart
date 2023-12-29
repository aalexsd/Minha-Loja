import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../bloc/wsf_param.dart';
import '../models/result.pessoa.dart';

class OfertaService {
  // static Future getOferta({String cep}) async {
  //   var data = {"id": user.id.toString()};

  //   return await http.post(Uri.parse(Wsf().baseUrlE4() + 'wsf_ofertas_v3.php'),
  //       body: data);
  //   //return await http.get(Uri.parse(Wsf().baseurl() + 'wsf_ofertas.php'));
  //   // if (response.statusCode == 200) {
  //   //   return response.body;
  //   //   //return ResultOferta.fromJson(response.body);
  //   // } else {
  //   //   throw Exception('Requisição inválida!');
  //   // }
  // }

  // static Future getCampanha() async {
  //   var data = {"id": user.id.toString()};

  //   return await http.post(Uri.parse(Wsf().baseurl() + 'wsf_campanha.php'),
  //       body: data);
  //   //return await http.get(Uri.parse(Wsf().baseurl() + 'wsf_campanha.php'));
  // }

  // static Future getEcom() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var pass = prefs.getString('senha');

  //   var data = json.encode({
  //     "header": {
  //       "token":
  //           "\$2y\$10\$K65UMhPom9XeDMS1yqAFHOndfki1eaDgmJJ44stnuUSU8lJvfqEeW"
  //     },
  //     "user": {
  //       "name": user.nome,
  //       "email": user.email,
  //       "password": user.senha ?? pass,
  //       "phone": user.celular
  //     }
  //   });
  //   print(Wsf().ecomAut());
  //   print(data);
  //   return await http.post(Uri.parse(Wsf().ecomAut()),
  //       headers: {
  //         "Accept": "application/json",
  //         "Content-Type": "application/json"
  //       },
  //       body: data);
  // }

  // static Future getBanner() async {
  //   var data = {"id": user.id.toString()};

  //   return await http.post(Uri.parse(Wsf().baseurl() + 'wsf_banner.php'),
  //       body: data);
  //   //return await http.get(Uri.parse(Wsf().baseurl() + 'wsf_banner.php'));
  //   // if (response.statusCode == 200) {
  //   //   return response.body;
  //   //   //return ResultOferta.fromJson(response.body);
  //   // } else {
  //   //   throw Exception('Requisição inválida!');
  //   // }
  // }

  static Future getProdutos() async {
    // var data = {
    //   "user": user.id.toString(),
    //   "loja": "1"
    // };
    return await http.get(
      Uri.parse(Wsf().baseurl() + 'produtos'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );
  }

  // static Future getPromo(idOferta) async {
  //   var data = {
  //     "user": "${user.id}",
  //     "idOferta": idOferta
  //   };
  //   print(data);
  //   return await http.post(Uri.parse(Wsf().baseurl() + 'wsf_oferta_det.php'),
  //       body: data);
  // }

  // Future<Map> getCombo(
  //     {String cupomDescontoId, num valorCompra, List produtos}) async {
  //   final Uri uri =
  //   Uri.parse("${Wsf().baseurl()}wsf_oferta_valida.php");
  //   final response = await http.post(uri,
  //       body: json.encode({
  //         "unidadeId": user.idLoja,
  //         "cupomDescontoId": cupomDescontoId,
  //         "clienteId": user.id,
  //         "valorCompra": valorCompra,
  //         "produtos": produtos
  //       }));
  //   print(response.statusCode);
  //   if (response.statusCode != 200 &&
  //       response.statusCode != 202 &&
  //       response.statusCode != 409) {
  //     throw const HttpException('Falha na requisição');
  //   }
  //   Map result = json.decode(response.body);
  //   return result;
  // }

  // static Future getCategorias() async {
  //   var data = {"user": user.id.toString()};

  //   //Uri.parse(Wsf().baseurl() + 'wsf_categorias.php'
  //   return await http.post(Uri.parse(Wsf().baseurl() + 'wsf_categorias.php'),
  //       body: data);
  // }

  // static Future getProduto(barcode) async {
  //   var data = {"user": user.id.toString(), "ean": barcode};

  //   return await http.post(Uri.parse(Wsf().baseurl() + 'wsf_produto_ean.php'),
  //       body: data);
  // }

  // static Future getCompras({String cep}) async {
  //   var data = {"id": user.id.toString()};

  //   return await http.post(Uri.parse(Wsf().baseurl() + 'wsf_compras.php'),
  //       body: data);
  // }
}
