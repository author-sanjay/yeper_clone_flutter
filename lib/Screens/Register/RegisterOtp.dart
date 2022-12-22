// ignore_for_file: file_names, implementation_imports, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
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
        child: Center(
            child: Column(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/register.svg",
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            RegisterVerify(),
          ],
        )),
      ),
    );
   
  }
}
