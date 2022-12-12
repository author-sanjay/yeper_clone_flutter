import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yeper_user/constants.dart';

import 'HeaderWithSearchbar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchbar(size: size),
          TextWithCustomUnderline(text: "Deals",)
        ],
      ),
    );
  }
}

class TextWithCustomUnderline extends StatelessWidget {
  const TextWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 5,
                margin: EdgeInsets.only(right: kDefaultPadding / 4),
                color: kprimarycolor.withOpacity(0.2),
              ))
        ],
      ),
    );
  }
}
