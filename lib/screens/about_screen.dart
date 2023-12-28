import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEFF5),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('home2');
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
                child: Text(
                  'Liderança',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      Text(
                        'Alex Duarte\n'
                            'CEO\n'
                            '22 anos\n'
                            'Brasileiro',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                        AssetImage('assets/images/teresa.jpeg'),
                      ),
                      Text(
                        'Teresa Starling\n'
                            'COO\n'
                            '22 anos\n'
                            'Brasileira',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Nossa Missão',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Nosso objetivo é fornecer aos nossos clientes os melhores produtos de tecnologia em um ambiente de compras online fácil e seguro. Acreditamos que a chave para uma experiência de compra online bem-sucedida é a facilidade de uso e a conveniência.\n'
                      '\nPor isso, nossa loja é fácil de navegar e oferece uma variedade de opções de pagamento seguras e rápidas. Além disso, nossa equipe de suporte está disponível 24 horas por dia, 7 dias por semana para ajudar com qualquer problema ou dúvida que você possa ter. \n'
                      '\nTrabalhamos apenas com os melhores fornecedores e marcas para garantir que você sempre tenha acesso aos produtos mais recentes e de alta qualidade. Na nossa loja, você pode encontrar desde smartphones, notebooks, tablets, acessórios e muito mais! \n'
                      '\nAgradecemos por escolher a nossa loja como seu destino de compras de tecnologia.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Sobre Nós',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Bem-vindo à nossa loja online de tecnologia - a sua fonte confiável para comprar os melhores produtos de tecnologia! Estamos comprometidos em fornecer aos nossos clientes uma experiência excepcional de compra online, oferecendo produtos de alta qualidade e um atendimento ao cliente excepcional.\n',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}