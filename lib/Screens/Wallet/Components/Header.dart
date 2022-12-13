// ignore_for_file: prefer_const_constructors, file_names, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: size.height * 0.3,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.3 - 27,
            decoration: BoxDecoration(
                color: kprimarycolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: GestureDetector(
              onTap: (() {
                print("Hello");
              }),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: size.height*0.10),
                child: Column(
                  
                  children: <Widget>[
                    Text(
                      "Your Balance",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                    Text(
                      "Rs 24",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 50),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
