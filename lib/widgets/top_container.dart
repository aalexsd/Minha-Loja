import 'package:flutter/material.dart';

class TopContainer extends StatefulWidget {
  final String title;


  const TopContainer({Key? key,
    required this.title,}) : super(key: key);

  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(children: [
        //   Text(
        //       title,
        //     style: const TextStyle(
        //       fontSize: 22,
        //       fontWeight: FontWeight.w500
        //     ),
        //   ),
        //   const Spacer(),
        //   Container(
        //     height: 40,
        //     width: 40,
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Colors.grey.withOpacity(0.3),
        //     ),
        //     child: Stack(
        //       children: [
        //         const Icon(FontAwesomeIcons.bell,
        //         color: Colors.black87,
        //         size: 22,),
        //         Positioned(
        //           right: 0,
        //           child: Container(
        //             height: 7,
        //             width: 7,
        //             decoration: const BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: Colors.deepOrange
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //   const SizedBox(
        //     width: 10,
        //   ),
        //   const CircleAvatar(
        //   radius: 25,
        //   backgroundImage: AssetImage('assets/images/avatar.png'),
        //   ),
        // ],
        // ),
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
