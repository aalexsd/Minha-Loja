import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/login_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 60,
          ),
          ListTile(
            title: const Text(
              'Menu',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Pagamento'),
            onTap: () {
              Navigator.of(context).pushNamed('payment');
            },
          ),
          ListTile(
            title: const Text('Contatos'),
            onTap: () {
              Navigator.of(context).pushNamed('contact');
            },
          ),
          ListTile(
            title: const Text('Sobre'),
            onTap: () {
              Navigator.of(context).pushNamed('about');
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () {
              sair(context);
            },
          ),
        ],
      ),
    );
  }

  sair(BuildContext context) {
    // var bloc = Provider.of<UserBloc>(context);
    //var res = await bloc.create(user);

    if (true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }
}
