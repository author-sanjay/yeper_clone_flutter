// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:yeper_user/Screens/Register/RegisterBody.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterBody(),
    );
  }
}
