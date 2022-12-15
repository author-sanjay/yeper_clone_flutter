// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/ChooseCard/Components/Header.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        children: <Widget>[
          HeaderWithSearchbar(size: size), 
          Card(cardName: "MasterCard",)
        ],
      ),
    ));
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key, required this.cardName,
  }) : super(key: key);
  final String cardName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text("$cardName\n",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                Text(
                  "XXXX XXXX XXXX",
                  style: TextStyle(fontSize: 18),
                ),
              ]),
        ),
      ),
    );
  }
}
