import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:testes/screens/login_screen.dart';
import '../bloc/ws_cadpessoa.dart';
import '../data/via_cep_service.dart';
import '../models/result.pessoa.dart';
import '../widgets/alert.dart';

class RegisterScreen2 extends StatefulWidget {
  final String nome;
  final String sobrenome;
  final String cpf;
  final String email;
  final String nasc;
  final String cel;
  final String sexo;
  final usuario = new ResultPessoa();

  String? cep;
  String? ende;
  String? numero;
  String? complemento;
  var _searchCepController = TextEditingController();
  var _endeController = TextEditingController();
  var _bairroController = TextEditingController();
  var _cidadeController = TextEditingController();
  var _ufController = TextEditingController();
  var _senha1 = TextEditingController();
  bool? _loading = false;
  bool? _enableField = true;
  String? _result;

  final _formKey = GlobalKey<FormState>();

  RegisterScreen2(
      
      {
      Key? key,
      required this.nome,
      required this.sobrenome,
      required this.cpf,
      required this.email,
      required this.nasc,
      required this.cel,
      required this.sexo})
      : super(key: key);

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  final _formKey = GlobalKey<FormState>();
  final _scaffKey = GlobalKey<ScaffoldState>();
  var senha1 = '';
  var senha2 = '';

  var _passwordVisible1 = false;
  var _passwordVisible2 = false;
  var cep = '';
  var ende = '';

  final FocusNode _fcep = FocusNode();

  bool _loading = false;
  bool _loadingCep = false;

  var maskFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

@override
  void initState() {
    super.initState();
    widget.usuario.nome = widget.nome;
    widget.usuario.sobrenome = widget.sobrenome;
    widget.usuario.cpf = widget.cpf;
    widget.usuario.email = widget.email;
    widget.usuario.nasc = widget.nasc;
    widget.usuario.celular = widget.cel;
    widget.usuario.sexo = widget.sexo;
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
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 5),
                child: Text(
                  'Continue seu registro',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: TextFormField(
                  inputFormatters: [maskFormatter],
                  textInputAction: TextInputAction.next,
                  focusNode: _fcep,
                  controller: widget._searchCepController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Digite o CEP",
                    border: new OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    suffixIcon: _loadingCep
                        ? SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator())
                        : IconButton(
                            icon: Icon(
                              Icons.search,
                            ),
                            onPressed: () {
                              _searchCep();
                            },
                          ),
                  ),
                  onFieldSubmitted: (value) => _fcep.nextFocus(),
                  onEditingComplete: () {
                    _fcep.nextFocus();
                    _searchCep();
                  },
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  onSaved: (val) {
                    cep = val!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: TextFormField(
                  // autofocus: true,
                  enabled: false,

                  keyboardType: TextInputType.text,
                  controller: widget._endeController,
                  decoration: InputDecoration(
                    labelText: "Endereço",
                    border: new OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    disabledBorder: new OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(0.3))),
                    labelStyle: TextStyle(
                      // color: Color(int.parse('0xFF' + myCustom.cor4)),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    // color: Color(int.parse('0xFF' + myCustom.cor4)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  enabled: false,
                  controller: widget._bairroController,
                  decoration: InputDecoration(
                    labelText: "Bairro",
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    disabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(
                            //color: Color(int.parse('0xFF' + myCustom.cor1)),.withOpacity(70)
                            color: Colors.black.withOpacity(0.3))),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  enabled: false,
                  controller: widget._cidadeController,
                  decoration: InputDecoration(
                    labelText: "Cidade",
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    disabledBorder: new OutlineInputBorder(
                      borderSide: BorderSide(
                          //color: Color(int.parse('0xFF' + myCustom.cor1)),.withOpacity(70)
                          color: Colors.black.withOpacity(0.3)),
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  enabled: false,
                  controller: widget._ufController,
                  decoration: InputDecoration(
                    labelText: "Estado",
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    disabledBorder: new OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.3),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  onSaved: (val) {
                    widget.usuario.complemento = val!;
                  },
                  decoration: InputDecoration(
                    labelText: "Complemento (Apto / Bloco / Casa)",
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                ),
                child: TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  onSaved: (val) {
                    widget.usuario.numero = val!;
                  },
                  decoration: InputDecoration(
                    labelText: "Digite o Número",
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  controller: widget._senha1,
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Insira uma Senha';
                    } else if (value!.length < 6) {
                      return 'Senha deve ter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                  obscureText: !_passwordVisible1,
                  decoration: InputDecoration(
                    hintText: 'Digite sua senha',
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordVisibility1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, right: 12, bottom: 12),
                        child: Text(
                          _passwordVisible1 ? 'Ocultar' : 'Exibir',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onSaved: (newValue) => widget.usuario.senha = newValue!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: TextFormField(
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Confirme sua Senha';
                    }
                    if (value!.length < 6) {
                      return 'Senha deve ter no mínimo 6 dígitos!';
                    }

                    if (value != widget._senha1.text) {
                      return 'Senhas não são iguais';
                    }

                    return null;
                  },
                  obscureText: !_passwordVisible2,
                  decoration: InputDecoration(
                    hintText: 'Confirme sua senha',
                    labelText: 'Confirme a Senha',
                    border: OutlineInputBorder(),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordVisibility2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, right: 12, bottom: 12),
                        child: Text(
                          _passwordVisible2 ? 'Ocultar' : 'Exibir',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
                          _formKey.currentState!.save();
                          setState(() {
                            _loading = true;
                          });
                          create1(context);
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

  Future _searchCep() async {
    _loadingCep = true;

    final cep = widget._searchCepController.text;

    final resultCep = await ViaCepService.fetchCep(cep: cep);
    // Exibindo somente a localidade no terminal
    if (resultCep.localidade == null) {
      showAlertDialog1ok(
          context, 'CEP não encontrado. Verifique e tente novamente!');
      print('nao achei');
      return false;
    } else {
      setState(() {
        widget._endeController.text = resultCep.logradouro!;
        widget._bairroController.text = resultCep.bairro!;
        widget._cidadeController.text = resultCep.localidade!;
        widget._ufController.text = resultCep.uf!;

        widget.usuario.cep = cep;
        widget.usuario.endereco = resultCep.logradouro;

        widget.usuario.bairro = resultCep.bairro;
        widget.usuario.cidade = resultCep.localidade;
        widget.usuario.uf = resultCep.uf;
        widget.usuario.ibge = resultCep.ibge;

        //idget._searchCepController.text
      });
    }
    _loadingCep = false;
  }

  void _togglePasswordVisibility1() {
    setState(() {
      _passwordVisible1 = !_passwordVisible1;
    });
  }

  void _togglePasswordVisibility2() {
    setState(() {
      _passwordVisible2 = !_passwordVisible2;
    });
  }

create1(BuildContext context) async {
  setState(() {
    _loading = true;
  });

  var res = await API.cadUsuario(widget.usuario);

  setState(() {
    _loading = false;
  });

  if (res) {
    // Usuário criado com sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Usuário criado com sucesso!'),
        behavior: SnackBarBehavior.floating,
      ),
    );

    // Agora, você pode navegar para a tela de login
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  } else {
    // Erro ao cadastrar usuário
    showAlertDialog1ok(context, 'Erro ao cadastrar usuário, tente novamente!');
  }
}


  // Future<void> _signUp(
  //     String nome, String email, String telefone, String senha) async {
  //   if (nome.isEmpty || email.isEmpty || telefone.isEmpty || senha.isEmpty) {
  //     showAlertDialog1ok(context, "Login e/ou Senha em branco");
  //     return;
  //   }

  //   var data = {
  //     "nome": nome,
  //     "email": email,
  //     "telefone": telefone,
  //     "senha": senha
  //   };
  //   var data2 = json.encode(data);

  //   try {
  //     final response = await http.post(
  //         Uri.parse("http://localhost:8081/cadastro"),
  //         body: data2,
  //         headers: {"Content-Type": "application/json"});
  //     print(response.statusCode);
  //     setState(() {
  //       _loading = false;
  //     });

  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('Usuário criado com Sucesso')));
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const LoginScreen(),
  //         ),
  //       );
  //     } else {
  //       // Trata erro de forma personalizada
  //       showAlertDialog1ok(context, "${jsonDecode(response.body)["error"]}");
  //     }
  //   } catch (e) {
  //     // Captura erro geral
  //     showAlertDialog1ok(context, "Erro ao realizar login. Detalhes: $e");
  //   }
  // }

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
