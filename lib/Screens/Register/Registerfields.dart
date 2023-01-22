// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, prefer_interpolation_to_compose_strings, empty_statements

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/LoginScreen/LoginScreen.dart';
import 'package:yeper_user/Screens/Register/OtpScreenRegister.dart';

import '../../constants.dart';

class Registerfields extends StatefulWidget {
  const Registerfields({super.key});
  static String verify = "";
  static String phone_number = "";

  @override
  State<Registerfields> createState() => _RegisterfieldsState();
}

class _RegisterfieldsState extends State<Registerfields> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    late String phone_number;
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2),
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
                child:
                    Text("Register and Start Earning with Your Credit Card")),
          ),
          TextField(
            onChanged: (value) {
              phone_number = value;
            },
            decoration: new InputDecoration(labelText: "Phone Number"),
            keyboardType: TextInputType.number,
          ), // Only numbers can be entered

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: (() async {
                setState(() {
                  loading = true;
                });
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: "+91" + phone_number,
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    Registerfields.verify = verificationId;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreenRegister(),
                      ),
                    );
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              }),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 43,
                decoration: BoxDecoration(
                    color: kprimarycolor,
                    borderRadius: BorderRadius.circular(20)),
                child: loading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                        "Send Code",
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
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              }),
              child: Center(
                child: Text(
                  "Already Have Account? Login!!!",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FilteringTextInputFormatter {}
