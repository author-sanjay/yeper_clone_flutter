// ignore_for_file: file_names, implementation_imports, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:yeper_user/Screens/Register/RegisterVerify.dart';

class RegisterOtp extends StatelessWidget {
  const RegisterOtp({super.key});

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
            children: <Widget>[
              Spacer(),
              Image(image: AssetImage("assets/images/logo.png")),
              Spacer(),
              RegisterVerify(),
              Spacer()
            ],
          )),
        ),
      ),
    );
  }
}
