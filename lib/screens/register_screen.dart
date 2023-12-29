import 'dart:convert';

import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:testes/bloc/wsf_param.dart';
import 'package:testes/screens/login_screen.dart';
import 'package:testes/screens/register_screen2.dart';
import '../models/result.pessoa.dart';
import '../widgets/alert.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _sobrenomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _telController = TextEditingController();
  final _nascController = TextEditingController();
  bool _loading = false;
  int _msexo = 0;
  var sexo = '';
  var nome = '';
  var sobrenome = '';
  var cpf = '';
  var email = '';
  var nasc = '';
  var cel = '';
  final usuario = ResultPessoa();

  var telmaskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var cpfmaskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var nascmaskFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Digite o seu nome completo";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve possuir caracteres de a-z ou A-Z";
    }
    return 'Erro';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEFF5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFEEEFF5),
          leading: SizedBox(
            child: TextButton(
              child: const Text(
                'Voltar',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              onPressed: () {
                onButtonDoneClicked(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Registre-se',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  'Crie sua conta Minha Loja',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return 'Insira seu Nome';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      nome = val!;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Digite seu Nome',
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: TextFormField(
                  controller: _sobrenomeController,
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira seu Sobrenome';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    sobrenome = val!;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Digite seu Sobrenome',
                    labelText: 'Sobrenome',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cpfController,
                  inputFormatters: [cpfmaskFormatter],
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira seu CPF';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    cpf = val!.toString().replaceAll(".", "");
                  },
                  decoration: const InputDecoration(
                    hintText: 'Digite seu CPF',
                    labelText: 'CPF',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira um Email';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    email = val!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: TextFormField(
                  controller: _telController,
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira um Telefone';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    cel = val!;
                  },
                  inputFormatters: [telmaskFormatter],
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu Telefone',
                    labelText: 'Telefone',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: TextFormField(
                  inputFormatters: [nascmaskFormatter],
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Informe sua Data de Nascimento';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Data de nascimento',
                    labelText: 'Data de nascimento',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (newValue) => nasc = newValue!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Sexo",
                        style: TextStyle(
                          // color: Color(int.parse('0xFF' + myCustom.cor4)),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    RadioListTile(
                      dense: true,
                      title: Text(
                        "Masculino",
                        style: TextStyle(
                          // color: Color(int.parse('0xFF' + myCustom.cor4)),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      value: 1,
                      groupValue: _msexo,
                      onChanged: (newValue) {
                        print(_msexo);
                        setState(() {
                          _msexo = newValue!;
                          sexo = "M";
                        });
                      },
                    ),
                    RadioListTile(
                      dense: true,
                      title: Text(
                        "Feminino",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      value: 2,
                      groupValue: _msexo,
                      onChanged: (newValue) {
                        print(_msexo);
                        setState(() {
                          _msexo = newValue!;
                          sexo = "F";
                        });
                      },
                    ),
                    RadioListTile(
                        dense: true,
                        title: Text(
                          "Prefiro não informar",
                          style: TextStyle(
                            // color: Color(int.parse('0xFF' + myCustom.cor4)),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        value: 3,
                        groupValue: _msexo,
                        onChanged: (newValue) {
                          print(_msexo);
                          setState(() {
                            _msexo = newValue!;
                            sexo = "N";
                          });
                        }),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {

                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            _loading = true;
                          });
                          if (CPFValidator.isValid(cpf)) {
                            _verifyUser();
                          } else {
                            showAlertDialog1ok(
                                context, 'CPF inválido, tente novamente.');
                            setState(() {
                              _loading = false;
                            });
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black87),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(color: Colors.black87))),
                      ),
                      child: _loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Prosseguir',
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  create1(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen2(
            nome: nome,
            sobrenome: sobrenome,
            cpf: cpf.toString().replaceAll(".", "").replaceAll("-", ""),
            email: email,
            nasc: nasc,
            cel: cel,
            sexo: sexo), //ResetPasswordPage(),
      ),
    );
    setState(() {
      _loading = false;
    });
  }

  Future<void> _verifyUser() async {
    try {
      final response = await http.post(
        Uri.parse(
            Wsf().baseurl() + 'verificar-usuario'), // Substitua pelo endereço correto da sua API
        body: jsonEncode({
          'cpf': _cpfController.text.replaceAll(".", "").replaceAll("-", ""),
          'email': _emailController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['exists']) {
          // Usuário já cadastrado, exibir mensagem
          showAlertDialog1ok(context, data['message']);
        } else {
          await create1(context);
        }
      } else {
        // Se houver algum problema na requisição, exibir mensagem de erro
        showAlertDialog1ok(context, 'Erro ao verificar usuário.');
      }
    } catch (error) {
      print(error);
      showAlertDialog1ok(context, 'Erro interno.');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}

void onButtonDoneClicked(BuildContext context) {
  Navigator.of(context).pushReplacementNamed('login');
}

bool valueValidator(String? value) {
  if (value != null && value.isEmpty) {
    return true;
  }
  return false;
}
