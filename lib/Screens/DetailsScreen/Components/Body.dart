// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/DetailsScreen/Components/IconsandImage.dart';
import 'package:yeper_user/Screens/DetailsScreen/Components/OfferDetails.dart';
import 'package:yeper_user/constants.dart';

class Body extends StatelessWidget {
  Body(
      {super.key,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.link,
      required this.platform,
      required this.id});
  int id;
  int actualprice;
  String card;
  int earning;
  int offer;
  String desc;
  String photo;
  String link;
  String platform;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: kprimarycolor,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.navigate_before, size: 40,color: Colors.white,)),
              Spacer(),
              Container(child: Text("Details", style: TextStyle(color: Colors.white),)),
              Spacer(),
            ]),
          )
        ],
      ),
    );
  }
}
