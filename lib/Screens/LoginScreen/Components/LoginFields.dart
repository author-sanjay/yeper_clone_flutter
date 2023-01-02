// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print, unnecessary_new, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yeper_user/Screens/OtpScreen/OtpScreen.dart';

import '../../../constants.dart';

class TextFields extends StatefulWidget {
  const TextFields({
    Key? key,
  }) : super(key: key);

  static String verify = "";
  static bool checked = false;
  static bool loading = false;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    late String phone_number;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(children: [
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Login With",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text("Mobile Number",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text("OTP will be sent on this mobile number",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: TextField(
              onChanged: (value) {
                phone_number = value;
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Phone Number',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  // fillColor: Colors.purpleAccent,
                  value: TextFields.checked,
                  onChanged: (bool? value) {
                    setState(() {
                      TextFields.checked = value!;
                    });
                  }),
              Flexible(
                  child: Text(
                      "By proceeding you accept the T&C and privacy policy"))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextFields.checked
                  ? Center(
                      child: GestureDetector(
                      onTap: (() async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: "+91" + phone_number,
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            TextFields.verify = verificationId;
                            TextFields.loading = true;
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }),
                      child: Container(
                          decoration: BoxDecoration(
                              color: kprimarycolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Center(
                              child: Text(
                            "Get OTP",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ))),
                    ))
                  : Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: kopacity,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Center(
                              child: Text(
                            "Please Accept T&C",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )))),
        ]),
      ),
    );
  }
}
