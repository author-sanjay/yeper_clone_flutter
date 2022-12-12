// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yeper_user/constants.dart';

import 'HeaderWithSearchbar.dart';
import 'TitleWithButton.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchbar(size: size),
          TitleWithButton(),
          Container(
            margin: EdgeInsets.only(
                left: kDefaultPadding,
                top: kDefaultPadding / 2,
                bottom: kDefaultPadding * 2.5),
            width: size.width * 0.4,
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/image_1.png"),
                Container(
                  padding: EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kprimarycolor.withOpacity(0.23))
                  ]),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Iphone 14 \n".toUpperCase(),
                                style: Theme.of(context).textTheme.button),
                            TextSpan(
                                text: "Visa".toUpperCase(),
                                style: TextStyle(
                                  color: kprimarycolor.withOpacity(0.9),
                                ))
                          ]))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: kprimarycolor
                              
                            ),
                            padding: EdgeInsets.only(top:15),
                            child: Text("hello"),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
