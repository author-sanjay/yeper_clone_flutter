import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../controller_new/auth_controllers/otp_controller.dart';
import '../reusable_widget/reusable_button.dart';

class NewOtpScreen extends StatefulWidget {
  const NewOtpScreen({super.key});

  @override
  State<NewOtpScreen> createState() => _NewOtpScreenState();
}

class _NewOtpScreenState extends State<NewOtpScreen> {
  String _otp = "";
  // void _next() {
  //   if (_formKey.currentState!.validate()) {
  //     OTPController.instance.verifyOTP(_otpController.text.trim());
  //   }
  // }
  final _formKey = GlobalKey<FormState>();
  TextEditingController _otpController = TextEditingController();
  void _submit() {
    if (_formKey.currentState!.validate()) {
      OTPController.instance.verifyOTP(_otpController.text.trim(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 96.h,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    "assets/images/register.svg",
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Enter OTP",
                    style: TextStyle(
                      color: Color(0xff212223),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Pinput(
                    controller: _otpController,
                    length: 6,
                    onCompleted: ((value) {
                      _otp = value;
                      print(_otp);
                    }),
                    validator: (s) {
                      if (s!.length != 6) {
                        return "Please Enter OTP";
                      }

                      return null;
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  ReusableButton(text: "Submit", onTap: _submit),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
