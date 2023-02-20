// ignore_for_file: prefer_const_constructors, file_names, unused_import, must_be_immutable, prefer_interpolation_to_compose_strings, avoid_print, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yeper_user/Components/PasswordLogin.dart';
import 'package:yeper_user/Screens/OrderConfirmation/Components/OrderBody.dart';
import 'package:http/http.dart' as http;
import 'package:yeper_user/Screens/OrderList/Body.dart';
import '../../api.dart';

class OrderPreview extends StatefulWidget {
  OrderPreview(
      {super.key,
      required this.orderid,
      required this.id,
      required this.status,
      required this.txn});

  String status;
  int orderid;
  int id;
  String txn;

  @override
  State<OrderPreview> createState() => _OrderPreviewState();
}

class _OrderPreviewState extends State<OrderPreview> {
  bool _isloading = true;
  Future<void> getdeal(id) async {
    // final json = jsonEncode({"order_status": "Placed", "platformtxnid": txnid});
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + PasswordLogin.token,
    };
    var res = await http.get(
      Uri.parse(api + "/deals/getsingle/" + id.toString()),
      headers: headers,
    );
    print(res.body);
    var result = jsonDecode(res.body);
    actualprice = result["actual_price"];
    // actual = json["actual_price"] as int,
    card = result["card"];
    // count = json["countleft"] as int,
    desc = result["description"];
    earning = result["user_earning"];
    photo = result["photourl"];
    // name = json["product_name"] as String,
    offer = result["offer_price"];
    // offerlink = json["offerlink"] as String,
    platform = result["platform"];

    setState(() {
      _isloading = false;
    });
  }

  late int actualprice;
  late String card;
  late String desc;
  late int earning;
  late String link;
  late int offer;
  late String photo;
  late String platform;

  @override
  void initState() {
    super.initState();
    getdeal(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: PreviewBody(
              txn: widget.txn,
              actualprice: actualprice,
              card: card,
              desc: desc,
              earning: earning,
              id: widget.id,
              offer: offer,
              photo: photo,
              platform: platform,
              orderid: widget.orderid,
              status: widget.status,
              key: widget.key,
              dropdownvalue: widget.status.toString(),
            )),
    );
  }
}
