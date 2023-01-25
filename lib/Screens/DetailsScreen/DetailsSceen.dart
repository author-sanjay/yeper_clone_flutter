// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/DetailsScreen/Components/Body.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(
      {super.key,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.link,
      required this.platform,
      required this.id,
      required this.name});
  int id;
  int actualprice;
  String card;
  int earning;
  int offer;
  String desc;
  String photo;
  String link;
  String platform;
  String name;
  // static late String pdtname;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
          name: widget.name,
          id: widget.id,
          actualprice: widget.actualprice,
          card: widget.card,
          desc: widget.desc,
          earning: widget.earning,
          offer: widget.offer,
          photo: widget.photo,
          // key: key,
          link: widget.link,
          platform: widget.platform),
      bottomNavigationBar: bottomnavbar(),
      // bottomNavigationBar: ActivateOffer(
      //     id: id,
      //     key: key,
      //     actualprice: actualprice,
      //     card: card,
      //     desc: desc,
      //     earning: earning,
      //     offer: offer,
      //     photo: photo,
      //     link: link,
      //     platform: platform),
    );
  }
}
