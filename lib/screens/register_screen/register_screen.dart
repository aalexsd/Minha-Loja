import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:testes/screens/login_screen/login_screen.dart';
import '../../widgets/alert.dart';
import '../home_screen/home_screen2.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _telController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
                'Feito',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                onButtonDoneClicked(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0, left: 10),
                child: Text(
                  'Registre-se',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 20),
                child: Text(
                  'Crie sua conta Minha Loja',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10, right: 30),
                child: TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira um Email';
                    }
                    return null;
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
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 30),
                child: TextFormField(
                  controller: _telController,
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira um Celular';
                    }
                    return null;
                  },
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu Celular',
                    labelText: 'Celular',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 30),
                child: TextFormField(
                  controller: _nameController,
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira seu Nome Completo';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Digite seu Nome Completo',
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 30),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira uma Senha';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Digite sua senha',
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 30),
                child: TextFormField(
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Confirme sua Senha';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Confirme sua senha',
                    labelText: 'Confirme sua senha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                       
                        if (_formKey.currentState!.validate()) {
                           setState(() {
                          _loading = true;
                        });
                          _myLogin(_nameController.text, _emailController.text,
                              _telController.text, _passwordController.text);
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
                      child: 
                      _loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          :
                      const Text(
                        'Registrar',
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

  Future<void> _myLogin(
      String nome, String email, String telefone, String senha) async {
    if (nome.isEmpty || email.isEmpty || telefone.isEmpty || senha.isEmpty) {
      showAlertDialog1ok(context, "Login e/ou Senha em branco");
      return;
    }

    var data = {
      "nome": nome,
      "email": email,
      "telefone": telefone,
      "senha": senha
    };
    var data2 = json.encode(data);

    try {
      final response = await http.post(Uri.parse("http://localhost:8081/users"),
          body: data2, headers: {"Content-Type": "application/json"});
      print(response.statusCode);
      setState(() {
        _loading = false;
      });

      if (response.statusCode == 200) {
      
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Conta criada com Sucesso')));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      } else {
        // Trata erro de forma personalizada
        showAlertDialog1ok(context, "${jsonDecode(response.body)["error"]}");
      }
    } catch (e) {
      // Captura erro geral
      showAlertDialog1ok(context, "Erro ao realizar login. Detalhes: $e");
    }
  }

  void onButtonDoneClicked(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('login');
  }
}

bool valueValidator(String? value) {
  if (value != null && value.isEmpty) {
    return true;
  }
  return false;
}
