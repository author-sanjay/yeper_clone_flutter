// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/DetailsScreen/Components/IconsandImage.dart';
import 'package:yeper_user/Screens/DetailsScreen/Components/OfferDetails.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    Size size= MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Column() 
            ),
            Container( 
            height: size.height*0.8,
            width: size.width*0.75,
            
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/img.png"))
            ),
            )
          ],
        )
      ],
=======
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size,
            actualprice: '25000',
            card: 'VISA',
            earning: '250',
            offerPrice: '20000',
          ),
          OfferDetails(Details: "This is the Description"),
        ],
      ),
>>>>>>> 7f44e06c55a7269ab9f484126e8681c95b73233e
    );
  }
}
