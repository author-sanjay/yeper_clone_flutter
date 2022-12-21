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
      required this.platform})
      : super(key: key);

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

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
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
        margin: EdgeInsets.only(
            left: kDefaultPadding * 0.5,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding * 2.5),
        width: size.width * 0.42,
        child: Column(
          children: <Widget>[
            Image.network(
              image,
              fit: BoxFit.cover,
              height: size.height * 0.25,
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kprimarycolor.withOpacity(0.23)),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "$itemname\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                            text: "$cardname\n".toUpperCase(),
                            style: TextStyle(
                              color: kprimarycolor.withOpacity(0.9),
                            ))
                      ]))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Earn",
                                style: TextStyle(color: Colors.green),
                              ),
                              Text(
                                "\$ $profit",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("$site"),
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
