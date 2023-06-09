import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0, left: 10),
                child: Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 20),
                child: Text(
                  'Redefina sua senha em duas etapas',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10, right: 30),
                child: TextFormField(
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira um Email ou Celular';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Digite seu Email ou Celular',
                    labelText: 'Email ou Celular',
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
                          onButtonDoneClicked(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Verifique sua caixa de Email')));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black87),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side:
                                        const BorderSide(color: Colors.black87))),
                      ),
                      child: const Text(
                        'Redefinir senha',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  void onButtonDoneClicked(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('login');
  }
}
