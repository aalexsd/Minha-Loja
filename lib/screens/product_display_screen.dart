import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testes/widgets/product_display_list_view.dart';
import 'package:testes/widgets/top_container.dart';

import '../models/result.pessoa.dart';


class ProductDisplayScreen extends StatefulWidget {
  const ProductDisplayScreen({Key? key}) : super(key: key);

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedValue = 0;
  int currentIndex = 0;



  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEFF5),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(FontAwesomeIcons.bars),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(
          'Olá, ${user.nome}',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Stack(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pushNamed('notify');
                    },
                        icon: const Icon(
                          FontAwesomeIcons.bell,
                          color: Colors.black87,
                          size: 22,),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 7,
                        width: 7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepOrange),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ),
            ],
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFEEEFF5),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Menu',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),),
              onTap: () {
              },
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
                Navigator.of(context).pushNamed('login');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const TopContainer(), // tab bar and tab views
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black87,
                indicatorSize: TabBarIndicatorSize.label,
                onTap: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  tabController.animateTo(value);
                },
                tabs: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedValue == 0
                          ? Colors.black87
                          : Colors.black87.withOpacity(0.2),
                    ),
                    child: const Text(
                      'Destaques',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedValue == 1
                          ? Colors.black87
                          : Colors.black87.withOpacity(0.4),
                    ),
                    child: const Text(
                      'Promoções',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // tab view

            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  ProductDisplayWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
