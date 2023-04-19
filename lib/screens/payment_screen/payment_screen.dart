import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<String> _cards = [
    "assets/images/card5.jpeg",
    "assets/images/card6.jpeg",
    "assets/images/card7.png"
  ];

  final _formKey = GlobalKey<FormState>();

  var cardNumberFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var expirationDateFormatter = MaskTextInputFormatter(
      mask: '##/##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var cvvFormatter = MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var zipCodeFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  String? _selectedCard;

  @override
  void initState() {
    super.initState();
    _selectedCard = _cards[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEFF5),
        title: Text(
          "Pagamento",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cartões salvos",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  height: 125.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _cards.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCard = _cards[index];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 16.0),
                          width: 200.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedCard == _cards[index]
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(_cards[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Novo cartão",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [cardNumberFormatter],
                  decoration: InputDecoration(
                    labelText: 'Número do cartão',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome do titular',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [expirationDateFormatter],
                        decoration: InputDecoration(
                          labelText: 'Validade',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [cvvFormatter],
                        decoration: InputDecoration(
                          labelText: 'CVV',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  inputFormatters: [zipCodeFormatter],
                  decoration: InputDecoration(
                    labelText: 'CEP',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.0),
                Center(
                  child: SizedBox(
                    height: 45,
                    width: 300,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black87),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(color: Colors.black87))),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
// payment process
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Cartão Adicionado com sucesso!')),
                          );
                        }
                      },
                      child: Text('Adicionar Cartão'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> contacts = [
  {
    'name': 'Afonso Duarte',
    'phone': '(61)1234-5678',
    'email': 'afonso@example.com',
    'cargo': 'Diretor'
  },
  {
    'name': 'Danilo Rodrigues',
    'phone': '(61)9987-6543',
    'email': 'danilo@example.com',
    'cargo': 'Diretor'
  },
  {
    'name': 'Evanio Junior',
    'phone': '(61)9987-6312',
    'email': 'evanio@example.com',
    'cargo': 'Diretor'
  },
  {
    'name': 'João Victor Muniz',
    'phone': '(61) 9987-3123',
    'email': 'JoaoVitor@example.com',
    'cargo': 'Diretor'
  },
  {
    'name': 'Vinicius Marchi',
    'phone': '(61)3213-5345',
    'email': 'vinicius@example.com',
    'cargo': 'Diretor'
  },
  {
    'name': 'Amanda Souza',
    'phone': '(11) 9876-5432',
    'email': 'AmandaS@example.com',
    'cargo': 'Coordenadora'
  },
  {
    'name': 'Lucas Oliveira',
    'phone': '(21) 9876-5432',
    'email': 'LucasO@example.com',
    'cargo': 'Analista'
  },
  {
    'name': 'Juliana Silva',
    'phone': '(31) 9987-3123',
    'email': 'JulianaS@example.com',
    'cargo': 'Estagiária'
  },
  {
    'name': 'Pedro Henrique Santos',
    'phone': '(85) 9876-5432',
    'email': 'PedroHS@example.com',
    'cargo': 'Gerente'
  },
  {
    'name': 'Carolina Costa',
    'phone': '(41) 9987-3123',
    'email': 'CarolinaC@example.com',
    'cargo': 'Coordenadora'
  },
  {
    'name': 'Gabriel Almeida',
    'phone': '(27) 9876-5432',
    'email': 'GabrielA@example.com',
    'cargo': 'Analista'
  },
  {
    'name': 'Luana Rocha',
    'phone': '(51) 9987-3123',
    'email': 'LuanaR@example.com',
    'cargo': 'Estagiária'
  },
  {
    'name': 'Rafael Santos',
    'phone': '(14) 9876-5432',
    'email': 'RafaelS@example.com',
    'cargo': 'Gerente'
  },
  {
    'name': 'Bianca Lima',
    'phone': '(19) 9987-3123',
    'email': 'BiancaL@example.com',
    'cargo': 'Coordenadora'
  },
  {
    'name': 'Vinícius Pereira',
    'phone': '(47) 9876-5432',
    'email': 'ViniciusP@example.com',
    'cargo': 'Analista'
  },
  {
    'name': 'Camila Costa',
    'phone': '(55) 9987-3123',
    'email': 'CamilaC@example.com',
    'cargo': 'Estagiária'
  },
  {
    'name': 'Mariana Carvalho',
    'phone': '(81) 9876-5432',
    'email': 'MarianaC@example.com',
    'cargo': 'Gerente'
  },
  {
    'name': 'Gustavo Castro',
    'phone': '(35) 9987-3123',
    'email': 'GustavoC@example.com',
    'cargo': 'Coordenador'
  },
  {
    'name': 'Fernanda Nunes',
    'phone': '(98) 9876-5432',
    'email': 'FernandaN@example.com',
    'cargo': 'Analista'
  },
  // add more contacts here as needed
];
