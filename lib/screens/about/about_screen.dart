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
                  'Nossa missão é fornecer aos nossos clientes uma experiência de compra online excepcional, oferecendo produtos de alta qualidade e um excelente atendimento ao cliente.\n',
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
                  'Bem-vindo à Minha Loja - sua loja online de confiança para comprar de tudo o que você precisa! Estamos comprometidos em fornecer a melhor experiência de compra online para nossos clientes em todo o mundo.\n'
                  '\nNossa loja é um lugar onde você pode encontrar uma ampla seleção de produtos, desde eletrônicos, roupas, acessórios, itens para casa e decoração, até produtos de beleza e saúde. Trabalhamos com os melhores fornecedores e marcas para garantir que você sempre tenha acesso aos produtos mais recentes e de alta qualidade.\n'
                  '\nAcreditamos que a chave para uma experiência de compra online bem-sucedida é a facilidade de uso e a conveniência. Por isso, nossa loja é fácil de navegar e oferece uma variedade de opções de pagamento seguras e rápidas.\n'
                  '\nAlém disso, acreditamos em fornecer um excelente atendimento ao cliente. Nossa equipe de suporte está disponível 24 horas por dia, 7 dias por semana para ajudar com qualquer problema ou dúvida que você possa ter.\n'
                  '\nNa Minha Loja, estamos sempre buscando melhorar e oferecer a melhor experiência de compra online possível. Obrigado por escolher a nossa loja como seu destino de compras.',
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
