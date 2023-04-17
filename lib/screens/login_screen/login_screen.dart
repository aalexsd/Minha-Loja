import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

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
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Insira um Email ou Celular';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.2, color: Colors.amber),
                            ),
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'Email ou Celular'),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 30),
                      child: TextFormField(
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.2, color: Colors.amber),
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
                                    color: Colors.blue,
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
                          style:
                              TextStyle(decoration: TextDecoration.underline),
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
                              Navigator.of(context).pushNamed('home');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.deepPurpleAccent),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: const BorderSide(
                                        color: Colors.deepPurpleAccent))),
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
                          indent: 30,
                          endIndent: 10,
                        )),
                        Text("ou"),
                        Expanded(
                            child: Divider(
                          thickness: 2,
                          indent: 10,
                          endIndent: 30,
                        )),
                      ]),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextButton(
                        child: const Text(
                          'Registre-se',
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
