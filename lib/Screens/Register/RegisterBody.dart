// ignore_for_file: file_names, prefer_const_constructors, empty_statements, dead_code

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/Register/Registerfields.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Container(
          color: Colors.white,
          child: Center(
              child: Column(
            children: const <Widget>[
              Spacer(),
              Image(image: AssetImage("assets/images/logo.png")),
              Spacer(),
              Registerfields(),
              Spacer(),
            ],
          )),
        ),
      ),
    );
    ;
  }
}
