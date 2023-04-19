import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotifyScreen extends StatefulWidget {
  NotifyScreen({Key? key}) : super(key: key);

  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  final List<String> notifications = [
    "Nova mensagem de John",
    "Seu pacote foi enviado",
    "10% de desconto em todos os itens hoje!",
    "Anúncio importante: manutenção do sistema esta noite",
    "Sua conta foi atualizada",
    "Parabéns! Você ganhou uma medalha",
    "Novo lançamento de produto na próxima semana",
    "Pedido confirmado! Seu item será entregue em breve.",
    "Aproveite nossa promoção e ganhe frete grátis em todas as compras!",
    "Sua senha foi alterada com sucesso. Caso não tenha sido você, entre em contato com o suporte.",
    "Você tem uma nova mensagem na sua caixa de entrada.",
    "Você atingiu a marca de 1000 pontos no nosso programa de fidelidade!",
    "Lembrete: hoje é o último dia para se inscrever no curso gratuito online.",
    "O novo modelo do seu celular favorito já está disponível para pré-venda!",
    "Parabéns pelo aniversário! Aqui está um cupom especial de desconto para você.",
    "Não perca a oportunidade de participar do nosso sorteio e ganhar prêmios incríveis!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEFF5),
        title: const Text(
          "Notificações",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(
              FontAwesomeIcons.bell,
              color: Colors.black,
            ),
            title: Text(
              notifications[index],
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              "Agora",
              style: TextStyle(color: Colors.black45),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
