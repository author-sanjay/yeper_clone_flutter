import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
