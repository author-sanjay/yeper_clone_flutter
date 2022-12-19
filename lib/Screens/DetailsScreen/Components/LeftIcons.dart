// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class LeftIcons extends StatelessWidget {
  const LeftIcons({
    Key? key,
    required this.actualprice,
    required this.offerPrice,
    required this.card,
    required this.earning
  }) : super(key: key);

  final String actualprice;
  final String offerPrice;
  final String card;
  final String earning;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
            ),
          ),
          Spacer(),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                color: kbackgroundColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 22,
                      color: kprimarycolor.withOpacity(0.22)),
                  BoxShadow(
                    offset: Offset(-15, -15),
                    blurRadius: 20,
                    color: Colors.white,
                  )
                ]),
            child: Container(
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "You \n pay",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: actualprice,
                        style: TextStyle(color: Colors.red, fontSize: 20))
                  ]))
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                color: kbackgroundColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 22,
                      color: kprimarycolor.withOpacity(0.22)),
                  BoxShadow(
                    offset: Offset(-15, -15),
                    blurRadius: 20,
                    color: Colors.white,
                  )
                ]),
            child: Container(
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "You \nGet",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: offerPrice,
                        style: TextStyle(color: Colors.green, fontSize: 20))
                  ]))
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                color: kbackgroundColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 22,
                      color: kprimarycolor.withOpacity(0.22)),
                  BoxShadow(
                    offset: Offset(-15, -15),
                    blurRadius: 20,
                    color: Colors.white,
                  )
                ]),
            child: Container(
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Card",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: card.toUpperCase(),
                        style: TextStyle(color: Colors.indigo, fontSize: 20))
                  ]))
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                color: kbackgroundColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 22,
                      color: kprimarycolor.withOpacity(0.22)),
                  BoxShadow(
                    offset: Offset(-15, -15),
                    blurRadius: 20,
                    color: Colors.white,
                  )
                ]),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "  Your \nEarning ",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: earning,
                        style: TextStyle(
                            color: Colors.amber.shade800, fontSize: 20))
                  ]))
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
