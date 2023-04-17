import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<String> itemsSide;
  final List<String> itemsBottom;
  final List<IconData> iconsSide;
  final List<IconData> iconsBottom;
  final List<Widget> pages;

  HomeScreen(
      {required this.itemsSide,
      required this.itemsBottom,
      required this.iconsSide,
        required this.iconsBottom,
      required this.pages});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isSideScreenOpen = false;

  void _handleMenuItemTap(int index) {
    setState(() {
      _isSideScreenOpen = false;
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: const [
           Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.shopping_cart),
          )
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
                _handleMenuItemTap(index);
              },
            );
          },
        ),
      ),
      body: widget.pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _handleMenuItemTap,
        items: List.generate(
          widget.itemsBottom.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(widget.iconsBottom[index]),
            label: widget.itemsBottom[index],
          ),
        ),
      ),
      endDrawer: _isSideScreenOpen
          ? Drawer(
              child: ListView.builder(
                itemCount: widget.itemsSide.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(widget.iconsSide[index]),
                    title: Text(widget.itemsSide[index]),
                    onTap: () {
                      _handleMenuItemTap(index);
                    },
                  );
                },
              ),
            )
          : null,
    );
  }
}
