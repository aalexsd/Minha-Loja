import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../widgets/alert.dart';
import '../home_screen/home_screen.dart';
import '../home_screen/home_screen2.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEFF5),
        body: Stack(children: [
          SizedBox(
            height: 400,
            width: 400,
            child: ClipRRect(
              child: Image.asset(
                'assets/images/logotipo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 265.0, top: 40),
                      child: SizedBox(
                        child: Text(
                          'Entrar',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 30),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Insira seu Email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.2, color: Colors.black26),
                            ),
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'Email'),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 30),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.2, color: Colors.black26),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Senha',
                            suffixIcon: InkWell(
                              onTap: _togglePasswordVisibility,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, right: 12, bottom: 12),
                                child: Text(
                                  _showPassword ? 'Ocultar' : 'Exibir',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )),
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextButton(
                        child: const Text(
                          'Esqueceu sua senha?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blueAccent),
                        ),
                        onPressed: () {
                          onForgotPasswordClicked(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _loading = true;
                              });
                              _myLogin(_emailController.text,
                                  _passwordController.text);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black87),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: const BorderSide(
                                        color: Colors.black87))),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(children: const <Widget>[
                        Expanded(
                            child: Divider(
                          thickness: 2,
                          indent: 70,
                          endIndent: 10,
                        )),
                        Text("ou"),
                        Expanded(
                            child: Divider(
                          thickness: 2,
                          indent: 10,
                          endIndent: 70,
                        )),
                      ]),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextButton(
                        child: const Text(
                          'Registre-se',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        onPressed: () {
                          onRegisterClicked(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  Future<void> _myLogin(String login, String senha) async {
    if (login.isEmpty || senha.isEmpty) {
      showAlertDialog1ok(context, "Login e/ou Senha em branco. Tente novamente.");
      return;
    }

    var data = {"email": login, "senha": senha};
    var data2 = json.encode(data);
    setState(() {
      _loading = false;
    });

    try {
      final response = await http.post(Uri.parse("http://localhost:8081/login"),
          body: data2, headers: {"Content-Type": "application/json"});
      print(response.statusCode);

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen2(),
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

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }
}

void onForgotPasswordClicked(BuildContext context) {
  Navigator.of(context).pushNamed('forgot_password');
}

void onRegisterClicked(BuildContext context) {
  Navigator.of(context).pushNamed('register');
}
