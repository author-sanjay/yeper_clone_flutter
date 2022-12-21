// ignore_for_file: prefer_const_constructors, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yeper_user/Screens/LoginScreen/Components/Body.dart';
import 'package:yeper_user/api.dart';
import '../../../constants.dart';
import '../../OrderConfirmation/OrderConfirmation.dart';

class ActivateOffer extends StatefulWidget {
  ActivateOffer(
      {Key? key,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.link,
      required this.platform,
      required this.id})
      : super(key: key);
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
  State<ActivateOffer> createState() => _ActivateOfferState();
}

class _ActivateOfferState extends State<ActivateOffer> {
  Map<String, String> headers = {"Content-type": "application/json"};
  Future<void> addorder() async {
    final json = jsonEncode({
      "order_status": "Unplaced",
      "date": (DateTime.now().day + DateTime.now().month + DateTime.now().year)
          .toString(),
      "product": "Details",
      "deal": widget.id,
    });
    var res = await http.post(
        Uri.parse(api +
            "/orders/add/" +
            user.id.toString() +
            "/" +
            widget.id.toString()),
        headers: headers,
        body: json);

    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Container(
        decoration: BoxDecoration(
            color: kprimarycolor,
            boxShadow: [
              BoxShadow(
                  offset: Offset(-10, -10),
                  blurRadius: 55,
                  color: kprimarycolor.withOpacity(0.23)),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: GestureDetector(
          onTap: () {
            // print(DateTime.now().month);
            addorder();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => OrderConfirmation(
            //       actualprice: widget.actualprice,
            //       card: widget.card,
            //       desc: widget.desc,
            //       earning: widget.earning,
            //       offer: widget.offer,
            //       photo: widget.photo,
            //       key: widget.key,
            //       link: widget.link,
            //       platform: widget.platform,
            //     ),
            //   ),
            // );
          },
          child: Align(
            alignment: Alignment.center,
            child: RichText(
                text: TextSpan(
                    text: "Activate Offer",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
          ),
        ),
      ),
    );
  }
}
