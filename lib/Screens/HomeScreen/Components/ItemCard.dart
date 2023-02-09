// ignore_for_file: file_names, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/DetailsScreen/DetailsSceen.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required this.itemname,
      required this.cardname,
      required this.profit,
      required this.site,
      required this.image,
      required this.press,
      required this.desc,
      required this.actual,
      required this.offer,
      required this.link,
      required this.platform,
      required this.id})
      : super(key: key);
  final int id;
  final String itemname;
  final String cardname;
  final double profit;
  final String site;
  final String image;
  final Function press;
  final int actual;
  final int offer;
  final String desc;
  final String link;
  final String platform;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String newname = itemname.split(" ")[0];
    String card = cardname.split(" ")[0];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
                key: key,
                name: itemname,
                id: id,
                link: link,
                platform: platform,
                actualprice: actual,
                card: cardname,
                earning: profit.toInt(),
                offer: offer,
                desc: desc,
                photo: image),
          ),
        );
      },
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.only(
            left: kDefaultPadding * 0.4,
            top: kDefaultPadding * 0.4,
            bottom: kDefaultPadding * 2.5),
        width: size.width * 0.45,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(10, 5),
                        blurRadius: 5,
                        color: kprimarycolor.withOpacity(0.23)),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(10, 5),
                        blurRadius: 5,
                        color: kprimarycolor.withOpacity(0.23)),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: newname.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.black)),
                        ])),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // height: MediaQuery.of(context).size.height * 0.,
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "₹ $profit",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "on $card \ncredit ard",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
