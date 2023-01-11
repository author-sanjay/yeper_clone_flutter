// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:yeper_user/Screens/Register/Details.dart';
import 'package:yeper_user/Screens/Register/Register.dart';
import 'package:yeper_user/Screens/Register/Registerfields.dart';
import 'package:yeper_user/constants.dart';

class RegisterVerify extends StatefulWidget {
  const RegisterVerify({super.key});
  static var uid;
  @override
  State<RegisterVerify> createState() => _RegisterVerifyState();
}

class _RegisterVerifyState extends State<RegisterVerify> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String code;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Register",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Center(
                child: Text(
                    "Register and Start Earning with \n         Your Credit Card")),
          ),
          // Only numbers can be entered
          Pinput(
            length: 6,
            onChanged: ((value) {
              code = value;
            }),
            validator: (s) {
              return null;
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: (() async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: Registerfields.verify, smsCode: code);

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);

                  RegisterVerify.uid = FirebaseAuth.instance.currentUser?.uid;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(),
                    ),
                  );
                  print("Success");
                } catch (_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                }
              }),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 43,
                decoration: BoxDecoration(
                    color: kprimarycolor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: GestureDetector(
                onTap: (() {}),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "    By Signing in You agree to our \n            Terms & Conditions",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
