import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      'name': 'Afonso Duarte',
      'phone': '(61)1234-5678',
      'email': 'afonso@example.com',
      'cargo': 'Gerente'
    },
    {
      'name': 'Danilo Rodrigues',
      'phone': '(61)9987-6543',
      'email': 'danilo@example.com',
      'cargo': 'Gerente'
    },
    {
      'name': 'Evanio Junior',
      'phone': '(61)9987-6312',
      'email': 'evanio@example.com',
      'cargo': 'Gerente'
    },
    {
      'name': 'João Victor Muniz',
      'phone': '(61) 9987-3123',
      'email': 'JoaoVitor@example.com',
      'cargo': 'Gerente'
    },
    {
      'name': 'Vinicius Marchi',
      'phone': '(61)3213-5345',
      'email': 'vinicius@example.com',
      'cargo': 'Gerente'
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
        title: const Text('Contatos',
        style: TextStyle(fontSize: 18,
          color: Colors.black
        ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return ListTile(
              leading: Icon(Icons.person),
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

  const ContactDetailsScreen({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEEFF5),
        title: const Text('Detalhes do Contato',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
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
