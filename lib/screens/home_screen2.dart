import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:testes/screens/product_display_screen.dart';
import 'package:testes/screens/profile_screen.dart';

import 'cart_screen.dart';
import 'category_display_screen.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int currentIndex = 0;
  int _currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  final tabBarICons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.user
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView(
            
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              // onPageChanged: (index){
              //   setState(() {
              //     _currentIndex = index ;
              //   });
              // },
              children: [
                const ProductDisplayScreen(),
                const CategoryDisplayScreen(),
                CartScreen(),
                ProfileScreen(),
              ],
            ),

            // bottom bar
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
               
                decoration: BoxDecoration(
                  
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    SalomonBottomBar(
                  
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        if (index == 9) {
                          return;
                        } else {
                          setState(() => _currentIndex = index);
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      selectedItemColor: Colors.white,
                      unselectedItemColor: Colors.white,
                      items: [
                        SalomonBottomBarItem(
                          icon: const Icon(Icons.home_outlined, size: 18,),
                          title: const Text("Início"),
                          selectedColor: Colors.white,
                          activeIcon: Icon(Icons.home, color: Colors.white, size: 22,),
                        ),
                        SalomonBottomBarItem(
                          icon: const Icon(Icons.category_outlined, size: 18,),
                          title: const Text("Categorias"),
                          selectedColor: Colors.white,
                        ),
                        SalomonBottomBarItem(
                          icon: const Icon(Icons.shopping_cart_outlined, size: 18,),
                          title: const Text("Carrinho"),
                          selectedColor: Colors.white,
                        ),
                        SalomonBottomBarItem(
                          icon: const Icon(Icons.person_outline, size: 18,),
                          title: const Text("Perfil"),
                          selectedColor: Colors.white,
                          activeIcon: Icon(Icons.person, color: Colors.white, size: 22,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
