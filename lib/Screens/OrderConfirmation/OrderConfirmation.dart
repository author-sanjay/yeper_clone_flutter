// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/OrderConfirmation/Components/OrderBody.dart';

class OrderConfirmation extends StatelessWidget {
  OrderConfirmation(
      {super.key,
      required this.orderid,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.link,
      required this.platform,
      required this.id,
      required this.status});

  String status;
  int orderid;
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
    return Scaffold(
      body: Container(
          child: OrderBody(
        actualprice: actualprice,
        card: card,
        desc: desc,
        earning: earning,
        id: id,
        link: link,
        offer: offer,
        photo: photo,
        platform: platform,
        orderid: orderid,
        status: status,
        key: key,
      )),
    );
  }
}
