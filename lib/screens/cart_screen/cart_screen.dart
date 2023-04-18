
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEFF5),
        title: const Text('Meu Carrinho',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black
        ),),
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      body: const Center(
        child: Text('Tela do Carrinho.'),
      ),
    );
  }
}