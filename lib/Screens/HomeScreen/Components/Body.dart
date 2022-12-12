// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'Doublecards.dart';
import 'HeaderWithSearchbar.dart';
import 'TitleWithButton.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchbar(size: size),
          TitleWithButton(),
          Column(
            children: [
              DoubleCards(),
              DoubleCards(),
              DoubleCards(),
              
            ],
          )
        ],
      ),
    );
  }
}
