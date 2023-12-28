import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  final List<String> itemsSide;
  final List<String> itemsBottom;
  final List<IconData> iconsSide;
  final List<IconData> iconsBottom;
  final List<Widget> pages;

  const HomeScreen({
    Key? key,
    required this.itemsSide,
    required this.itemsBottom,
    required this.iconsSide,
    required this.iconsBottom,
    required this.pages,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isleftSideScreenOpen = false;

  void _handleSideMenuItemTap(int index) {
    switch (widget.itemsSide[index]) {
      case 'Início':
        Navigator.of(context).pop();
        _currentIndex = 0;
        break;
      case 'Sobre':
        Navigator.of(context).pushNamed('about');
        break;
      case 'Contato':
        Navigator.of(context).pushNamed('contact');
        break;
      case 'Pagamento':
        Navigator.of(context).pushNamed('payment');
        break;
      case 'Sair':
        Navigator.of(context).pushNamed('login');
        break;
      default:
        if (index >= 0 && index < widget.pages.length) {
          setState(() {
            _isleftSideScreenOpen = false;
            _currentIndex = index;
          });
        }
        break;
    }
  }

  void _handleBottomMenuItemTap(int index) {
    switch (widget.itemsBottom[index]) {
      case 'Buscar':
        Navigator.of(context).pushNamed('search');
        break;
      case 'Perfil':
        Navigator.of(context).pushNamed('profile');
        break;
      default:
        if (index >= 0 && index < widget.pages.length) {
          setState(() {
            _isleftSideScreenOpen = false;
            _currentIndex = index;
          });
        }
        break;
    }
  }

  void _showCartScreen() {
    Navigator.of(context).pushNamed('cart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEFF5),
        title: const Text(
          'Minha Loja',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: _showCartScreen,
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: widget.itemsSide.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(widget.iconsSide[index]),
              title: Text(widget.itemsSide[index]),
              onTap: () {
                _handleSideMenuItemTap(index);
              },
            );
          },
        ),
      ),
      body: widget.pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _handleBottomMenuItemTap,
        items: List.generate(
          widget.itemsBottom.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(widget.iconsBottom[index]),
            label: widget.itemsBottom[index],
          ),
        ),
      ),
    );
  }
}
