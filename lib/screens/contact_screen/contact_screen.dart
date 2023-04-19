import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFFEEEFF5),
        title: const Text(
          'Contatos',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(contact['name']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contact['phone']!),
                  Text(contact['email']!),
                  Text(contact['cargo']!),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailsScreen(
                      contact: contact,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ContactDetailsScreen extends StatelessWidget {
  final Map<String, String> contact;

  const ContactDetailsScreen({Key? key, required this.contact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEEFF5),
        title: const Text(
          'Detalhes do Contato',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${contact['name']}'),
            Text('Phone: ${contact['phone']}'),
            Text('Email: ${contact['email']}'),
            Text('Cargo: ${contact['cargo']}'),
          ],
        ),
      ),
    );
  }
}
