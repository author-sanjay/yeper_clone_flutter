// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yeper_user/constants.dart';

import 'HeaderWithSearchbar.dart';
import 'ItemCard.dart';
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
          ItemCard(cardname: 'VISA', itemname: 'iPhone 13', profit: 5, site: 'Flipkart', image: 'assets/images/image_1.png', press: (){},)
        ],
      ),
    );
  }
}
