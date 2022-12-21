// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/OrderConfirmation/OrderConfirmation.dart';

import '../../../constants.dart';

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
      required this.platform})
      : super(key: key);

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
            OrderConfirmation(
              actualprice: widget.actualprice,
              card: widget.card,
              desc: widget.desc,
              earning: widget.earning,
              offer: widget.offer,
              photo: widget.photo,
              key: widget.key,
              link: widget.link,
              platform: widget.platform,
            );
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
