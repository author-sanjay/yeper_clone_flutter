import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/Screens/OtpScreen/OtpScreen.dart';

import '../controller_new/auth_controllers/otp_controller.dart';
import '../controller_new/auth_controllers/signup_controller.dart';
import '../reusable_widget/reusable__textfield.dart';
import '../reusable_widget/reusable_button.dart';
import '../utils/image_utils.dart';

class LoginNewScreen extends StatefulWidget {
  const LoginNewScreen({super.key});

  @override
  State<LoginNewScreen> createState() => _LoginNewScreenState();
}

class _LoginNewScreenState extends State<LoginNewScreen> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  bool _isChecked = true;
  final _formKey = GlobalKey<FormState>();
  bool _showTermsError = false;
  bool _showOTP = false;

  void _sendOTP() {
    if (_formKey.currentState!.validate() && !_showOTP) {
      SignUpController.instance
          .phoneAuthentication("+91" + _phoneController.text.trim(),context);
      _showOTP = true;
      setState(() {});
      // Get.to(() => NewOtpScreen());
    }
  }

  void _submit() {
    if (!_isChecked) {
      _showTermsError = !_isChecked;
      setState(() {});
    }
    if (_formKey.currentState!.validate() && _isChecked) {
      OTPController.instance.verifyOTP(_otpController.text.trim(), context);
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 96.h,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Center(
                        child: Container(
                          width: 65.w,
                          height: 22.h,
                          child: Image.asset(
                            ImageUtils.logo,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Login with\nMobile Number",
                        style: TextStyle(
                            color: Color(0xff212223),
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                            fontSize: 20,
                            letterSpacing: 1.15),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "OTP will sent on this mobile number",
                        style: TextStyle(
                          color: Color(0xff8A8B8F),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      ReusbleTextField(
                        hint: "Mobile Number",
                        controller: _phoneController,
                        isPhone: true,
                        isOtp: true,
                        onTap: _sendOTP,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      _showOTP
                          ? ReusbleTextField(
                              hint: "Enter OTP",
                              controller: _otpController,
                              isEnterOtp: true,
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.all(Color(0xff29295D)),
                              value: _isChecked,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onChanged: (bool? value) {
                                _isChecked = value!;
                                if (_isChecked) {
                                  _showTermsError = !_isChecked;
                                }
                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          RichText(
                            // textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'By, proceding, you agree to the',
                                style: TextStyle(
                                  color: Color(0xff9A9A9A),
                                  fontSize: 10,
                                  //  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Terms & Conditions\n',
                                      style: TextStyle(
                                        color: Color(0xff29295D),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                        }),
                                  TextSpan(
                                      text: 'and',
                                      style: TextStyle(
                                        color: Color(0xff9A9A9A),
                                        fontSize: 10,
                                        //  fontWeight: FontWeight.w600,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                        }),
                                  TextSpan(
                                      text: ' Privacy Policy',
                                      style: TextStyle(
                                        color: Color(0xff29295D),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                        })
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      _showTermsError
                          ? Text(
                              "Please Aceepet Terms and Conditions",
                              style: TextStyle(color: Colors.red),
                            )
                          : SizedBox.shrink(),
                      Spacer(
                        flex: 5,
                      ),
                      ReusableButton(text: "Next", onTap: _submit),
                      SizedBox(
                        height: 32,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
