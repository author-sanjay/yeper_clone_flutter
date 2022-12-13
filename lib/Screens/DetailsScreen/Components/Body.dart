// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yeper_user/constants.dart';

import 'RightImageDetailPage.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: size.height * 0.8,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: LeftSideDetailPage(actualprice: '25000',offerPrice: '20000',card: 'VISA',earning: '500',),
              )),
              RightImageDetailPage(size: size)
            ],
          ),
        )
      ],
    );
  }
}



class LeftSideDetailPage extends StatelessWidget {
  const LeftSideDetailPage({
    Key? key, required this.actualprice, required this.offerPrice, required this.card, required this.earning,
    
  }) : super(key: key);

  final String actualprice;
  final String offerPrice;
  final String card;
  final String earning;
  
  @override
  Widget build(BuildContext context) {

    return Column(
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
                        text: "Actual \nPrice",
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
                        text: "Offer \nPrice",
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
                      text: card,
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
                        text: "  Your\nEarning ",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: earning,
                      style: TextStyle(color: Colors.amberAccent.shade700, fontSize: 20))
                ]))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
