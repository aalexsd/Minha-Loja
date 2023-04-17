import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              hintText: 'Username'
                          ),
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
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Password'
                          ),
                          obscureText: true,
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
                        child: TextButton(
                          child: const Text('Esqueceu sua senha?',
                          style: TextStyle(
                            decoration: TextDecoration.underline
                          ),),
                          onPressed: (){
                            print('Esqueci!');
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
}

