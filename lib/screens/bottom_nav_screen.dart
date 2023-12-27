import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:testes/screens/profile_screen/profile_screen.dart';
import 'cart_screen/cart_screen.dart';
import 'home_screen/category_display_screen.dart';
import 'home_screen/product_display_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProductDisplayScreen(),
    const CategoryDisplayScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.black87,
        margin: const EdgeInsets.all(12.0),
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 9) {
            return;
          } else {
            setState(() => _currentIndex = index);
          }
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text("Início"),
            selectedColor: Colors.white,
            activeIcon: Icon(Icons.home, color: Colors.white),
          ),
          SalomonBottomBarItem(
            icon: const Icon(FontAwesomeIcons.compass,),
            title: const Text("Categorias"),
            selectedColor: Colors.white,
            activeIcon: Icon(FontAwesomeIcons.solidCompass)
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            title: const Text("Carrinho"),
            selectedColor: Colors.white,
            activeIcon: Icon(Icons.shopping_cart)
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person_outline),
            title: const Text("Perfil"),
            selectedColor: Colors.white,
            activeIcon: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
