import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  Size size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: 
          Column(),
          ),
          Container(),
        ],
      )
    ],);
  }
}