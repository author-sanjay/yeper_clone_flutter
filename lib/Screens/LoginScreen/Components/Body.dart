// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, unnecessary_new, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yeper_user/Screens/LoginScreen/Components/LoginFields.dart';
import 'package:yeper_user/modals/UserModal.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                "assets/images/register.svg",
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              TextFields(),
            ],
          )),
    );
  }
}
