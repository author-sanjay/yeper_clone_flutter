import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yeper_user/Screens/Register/OtpScreenRegister.dart';

import '../../constants.dart';

class Registerfields extends StatelessWidget {
  const Registerfields({super.key});
  static String verify = "";
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
                child: Text(
                    "Register and Start Earning with Your Credit Card")),
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
                child: Center(
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
        ],
      ),
    );
    ;
  }
}

class FilteringTextInputFormatter {}
