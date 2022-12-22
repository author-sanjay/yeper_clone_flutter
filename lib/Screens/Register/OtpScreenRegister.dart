// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/Register/RegisterOtp.dart';

class OtpScreenRegister extends StatelessWidget {
  const OtpScreenRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterOtp(),
    );
  }
}
