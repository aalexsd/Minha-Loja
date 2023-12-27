import 'package:flutter/material.dart';

class TopContainer extends StatefulWidget {

  const TopContainer({Key? key}) : super(key: key);


  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 5),
                prefixIcon: Icon(Icons.search,
                  color: Colors.black,
                  size: 25,),
                border: InputBorder.none,
                hintText: 'Buscar',
            ),
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
      ],
    );
  }
}
