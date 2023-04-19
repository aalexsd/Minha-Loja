import 'package:flutter/material.dart';
import 'package:testes/screens/about/about_screen.dart';
import 'package:testes/screens/cart_screen/cart_screen.dart';
import 'package:testes/screens/contact_screen/contact_screen.dart';
import 'package:testes/screens/forgot_password/forgot_password.dart';
import 'package:testes/screens/home_screen/home_screen.dart';
import 'package:testes/screens/home_screen/home_screen2.dart';
import 'package:testes/screens/login_screen/login_screen.dart';
import 'package:testes/screens/notify_screen/notify_screen.dart';
import 'package:testes/screens/payment_screen/payment_screen.dart';
import 'package:testes/screens/profile_screen/profile_screen.dart';
import 'package:testes/screens/register_screen/register_screen.dart';
import 'package:testes/screens/search_screen/search_screen.dart';

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
        initialRoute: 'home2',
        routes: {
          'login': (context) => const LoginScreen(),
          'forgot_password': (context) => const ForgotPassword(),
          'register': (context) => const RegisterScreen(),
          'home': (context) =>  HomeScreen(
                itemsSide: ['Início', 'Pagamento', 'Sobre', 'Contato', 'Sair'],
                itemsBottom: ['Início', 'Buscar', 'Perfil'],
                iconsSide: [
                  Icons.home,
                  Icons.payment,
                  Icons.info,
                  Icons.contacts,
                  Icons.exit_to_app
                ],
                iconsBottom: [Icons.home, Icons.search, Icons.person],
                pages: [
                  Center(
                    child: Text('Itens da Loja'),
                  ),
                  Center(
                    child: Text('Buscar itens'),
                  ),
                  Center(
                    child: ProfileScreen(),
                  ),
                ],
              ),
          'cart': (context) => CartScreen(),
          'payment': (context) => PaymentScreen(),
          'about': (context) => const AboutScreen(),
          'contact': (context) => ContactScreen(),
          'profile': (context) => ProfileScreen(),
          'search': (context) => const SearchScreen(),
          'home2': (context) =>  HomeScreen2(),
          'notify': (context) =>  NotifyScreen(),
        });
  }
}
