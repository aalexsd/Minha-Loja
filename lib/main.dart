import 'package:flutter/material.dart';
import 'package:testes/screens/forgot_password/forgot_password.dart';
import 'package:testes/screens/home_screen/home_screen.dart';
import 'package:testes/screens/login_screen/login_screen.dart';
import 'package:testes/screens/register_screen/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        routes: {
          'login': (context) => const LoginScreen(),
          'forgot_password': (context) => const ForgotPassword(),
          'register': (context) => const RegisterScreen(),
          'home': (context) => HomeScreen(
                itemsSide: const ['Início', 'Pagamento', 'Sobre', 'Contato'],
                itemsBottom: const ['Início', 'Buscar', 'Perfil'],
                iconsSide: const [Icons.home, Icons.payment, Icons.info, Icons.contacts],
                iconsBottom: const [Icons.home, Icons.search, Icons.person],
                pages: const [
                  Center(
                    child: Text('Itens da Loja'),
                  ),
                  Center(
                    child: Text('Buscar itens'),
                  ),
                  Center(
                    child: Text('Perfil do usuário'),
                  ),
                ],
              ),
        });
  }
}
