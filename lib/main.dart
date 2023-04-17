import 'package:flutter/material.dart';
import 'package:testes/screens/forgot_password/forgot_password.dart';
import 'package:testes/screens/login_screen/login_screen.dart';

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
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginScreen(),
        'forgot_password': (context) => const ForgotPassword(),
      },
    );
  }
}