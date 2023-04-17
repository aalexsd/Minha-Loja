import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
        body: Stack(
          children: [
            SizedBox(
              width: 400,
              child: ClipRRect(
                child: Image.asset('assets/images/logotipo.png',
                  fit: BoxFit.cover,),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 550,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 265.0,
                        top: 50),
                        child: SizedBox(
                          child: Text('Sign in',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,
                            left: 10,
                            right: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.2, color: Colors.amber
                                ),
                              ),
                              prefixIcon: Icon(Icons.mail),
                              hintText: 'Email ou Celular'
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,
                            left: 10,
                            right: 30),
                        child: TextFormField(
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.2, color: Colors.amber
                                ),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              hintText: 'Senha',
                              suffixIcon: InkWell(
                                onTap: _togglePasswordVisibility,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0,
                                      right: 12,
                                      bottom: 12),
                                  child: Text(
                                    _showPassword ? 'Ocultar' : 'Exibir',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                          ),
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          width: 300,
                          height: 60,
                          child: ElevatedButton(onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: const BorderSide(color: Colors.deepPurpleAccent)
                                  )
                              ),
                            ),
                            child: const Text('Login',
                              style: TextStyle(
                                  fontSize: 17
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextButton(
                          child: const Text('Registre-se',
                            ),
                          onPressed: (){
                            onRegisterClicked(context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextButton(
                          child: const Text('Esqueceu sua senha?',
                          style: TextStyle(
                            decoration: TextDecoration.underline
                          ),),
                          onPressed: (){
                            onForgotPasswordClicked(context);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ]),
        );
  }
  void _togglePasswordVisibility(){
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}

void onForgotPasswordClicked(BuildContext context){
  Navigator.of(context).pushNamed('forgot_password');
}
void onRegisterClicked(BuildContext context){
  Navigator.of(context).pushNamed('register');
}



