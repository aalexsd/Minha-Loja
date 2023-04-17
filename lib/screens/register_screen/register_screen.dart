import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEFF5),
        leading: SizedBox(
          child: TextButton(
            child: const Text(
              'Feito',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
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
                      onButtonDoneClicked(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Conta criada com Sucesso')));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.blue[900]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.blue))),
                    ),
                    child: const Text(
                      'Registrar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onButtonDoneClicked(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('login');
  }
}
