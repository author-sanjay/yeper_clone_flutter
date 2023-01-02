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
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              headerwithname(),
              SizedBox(
                height: 10,
              ),
              imageofproduct(),
              
            ],
          ),
        ),
      ),
    );
  }
}

class imageofproduct extends StatelessWidget {
  const imageofproduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      // color: Colors.cyan,
      child: Image(
          image: AssetImage("assets/images/image (1).jpg"),
          fit: BoxFit.cover),
    );
  }
}

class headerwithname extends StatelessWidget {
  const headerwithname({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kprimarycolor,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.navigate_before,
              size: 40,
              color: Colors.white,
            )),
        Spacer(),
        Text(
          "Details",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300),
        ),
        Spacer(),
      ]),
    );
  }
}
