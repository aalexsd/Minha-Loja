import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:testes/screens/login_screen.dart';
import 'package:testes/widgets/product_display_list_view.dart';
import 'package:testes/widgets/side_menu.dart';
import 'package:testes/widgets/top_container.dart';

import '../data/oferta_service.dart';
import '../models/cart-item.model.dart';
import '../models/product-details.model.dart';
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
  bool _loading = false;
  var produtos = <ProductDetailsModel>[];
  var produtosall = <ProductDetailsModel>[];
  final _searchCepController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getProdutos();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;
    final price = NumberFormat("#,##0.00", "pt_BR");
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black87,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Text(
            'Olá, ${user.nome}',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w300, color: Colors.white),
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
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('notify');
                        },
                        icon: const Icon(
                          FontAwesomeIcons.bell,
                          color: Colors.black87,
                          size: 22,
                        ),
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
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: SideMenu(),
        body: Container(
          height: screenHeight,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _searchCepController,
                    onChanged: (value) {
                      _filtrar(value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      hintText: 'Pesquise produtos',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _compras(context, screenHeight, screenW),
                flex: 4,
              ),
            ],
          ),
        ));
  }

  Widget _compras(context, screenH, screenW) {
    return _loading
        ? CircularProgressIndicator()
        : ListView.builder(
            itemCount: produtos.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return _itemCompra(context, index, produtos, screenH, screenW);
            });
  }

  Widget _itemCompra(context, index, ofertas, screenH, screenW) {
    var prod = ofertas[index];

    var cartItem = CartItemModel(
      id: prod.id.toString(),
      price: prod.price,
      image: prod.images,
      title: prod.title,
    );

    return GestureDetector(
      onTap: () {
        print('Cliquei no item');
        print(index);
      },
      child: Container(
        height: screenH * 0.1,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 80,
                width: 80,
                child: Image.network(prod.images!),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    prod.title!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "R\$ ${prod.price!.toStringAsFixed(2).replaceAll('.', ',')}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      // Adicione outros ícones ou elementos conforme necessário
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[300]
              ),
                onPressed: () {},
                child: Icon(Icons.shopping_cart),
                ),
                SizedBox(width: 5),
          ],
        ),
      ),
    );
  }

  _filtrar(text) {
    produtos = [];

    produtosall.forEach((element) {
      if (element.title!.contains(text.toString().toUpperCase())) {
        produtos.add(element);
      }
    });
    setState(() {
      _searchCepController.text = text;
    });
  }

  _getProdutos() async {
    //final cep = widget._searchCepController.text;
    setState(() {
      _loading = true;
    });
    //final resultOferta = await OfertaService.getOferta(cep: '1');
    await OfertaService.getProdutos().then((resultProd) {
      if (mounted) {
        setState(() {
          Iterable list = json.decode(resultProd.body);
          //print(list);
          produtos =
              list.map((model) => ProductDetailsModel.fromJson(model)).toList();
          produtosall = produtos;
          print(jsonEncode(produtos));
          _loading = false;
        });
      }
    });
  }
}
