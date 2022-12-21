// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/DetailsScreen/Components/Body.dart';

import 'Components/ActivateOffer.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen(
      {super.key,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.link,
      required this.platform});
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
    return Scaffold(
      body: Body(
          actualprice: actualprice,
          card: card,
          desc: desc,
          earning: earning,
          offer: offer,
          photo: photo,
          key: key),
      bottomNavigationBar: ActivateOffer(),
    );
  }
}
