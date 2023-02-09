import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/LoginScreen/Components/PasswordLogin.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/api.dart';
import 'package:yeper_user/constants.dart';

class KYC extends StatelessWidget {
  const KYC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("KYC",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
        backgroundColor: Colors.white,
        elevation: 0.1,
      ),
      body: kycbody(),
    );
  }
}

class kycbody extends StatefulWidget {
  const kycbody({
    super.key,
  });
  static late String acnumber;
  static late String bankname;
  static late String ifsc;
  static late String gst;
  static late String pan;
  @override
  State<kycbody> createState() => _kycbodyState();
}

class _kycbodyState extends State<kycbody> {
  Future<void> update(
      String ac, String bank, String ifsc, String gst, String pan) async {
    final json = jsonEncode({
      "acnumber": ac,
      "bankname": bank,
      "idfc": ifsc,
      "gst": gst,
      "pan": pan
    });
    print(json);
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + PasswordLogin.token,
    };
    var res =
        await http.post(Uri.parse(api + "/kyc"), headers: headers, body: json);
    if (res.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        child: Column(
          children: [
            Text(
              "Update KYC",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "We Use it only for Payment\n and Tax records",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  if (user.acnumber != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account Number",
                          style: TextStyle(fontSize: 12),
                        ),
                        TextField(
                          onChanged: (value) {
                            kycbody.acnumber = value;
                          },
                          decoration: InputDecoration(labelText: user.acnumber),
                        )
                      ],
                    )
                  else
                    TextField(
                      onChanged: (value) {
                        kycbody.acnumber = value;
                      },
                      decoration:
                          const InputDecoration(labelText: "Account Number"),
                    ),
                  SizedBox(height: 10),
                  user.bankname != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank Name",
                              style: TextStyle(fontSize: 12),
                            ),
                            TextField(
                              onChanged: (value) {
                                kycbody.acnumber = value;
                              },
                              decoration:
                                  InputDecoration(labelText: user.bankname),
                            )
                          ],
                        )
                      : TextField(
                          onChanged: (value) {
                            kycbody.bankname = value;
                          },
                          decoration:
                              const InputDecoration(labelText: "Bank Name"),
                        ),
                  SizedBox(height: 10),
                  user.idfc != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "IFSC Code",
                              style: TextStyle(fontSize: 12),
                            ),
                            TextField(
                              onChanged: (value) {
                                kycbody.acnumber = value;
                              },
                              decoration: InputDecoration(labelText: user.idfc),
                            )
                          ],
                        )
                      : TextField(
                          onChanged: (value) {
                            kycbody.ifsc = value;
                          },
                          decoration:
                              const InputDecoration(labelText: "Bank IFSC"),
                        ),
                  SizedBox(height: 10),
                  user.gst != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "GST Number",
                              style: TextStyle(fontSize: 12),
                            ),
                            TextField(
                              onChanged: (value) {
                                kycbody.acnumber = value;
                              },
                              decoration: InputDecoration(labelText: user.gst),
                            )
                          ],
                        )
                      : TextField(
                          onChanged: (value) {
                            // phone_number = value;
                            // DetailsFields.address = value;
                            kycbody.gst = value;
                          },
                          decoration: const InputDecoration(
                              labelText: "GST Number (Optional)"),
                        ),
                  SizedBox(height: 10),
                  user.pan != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pan Number",
                              style: TextStyle(fontSize: 12),
                            ),
                            TextField(
                              onChanged: (value) {
                                kycbody.acnumber = value;
                              },
                              decoration: InputDecoration(labelText: user.pan),
                            )
                          ],
                        )
                      : TextField(
                          onChanged: (value) {
                            // DetailsFields.referal = value;
                            kycbody.pan = value;
                          },
                          decoration:
                              const InputDecoration(labelText: "Pan Number"),
                          // keyboardType: TextInputType.number,
                        ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: (() {
                      // setState(() {
                      //   adduser();
                      // });
                    }),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: kprimarycolor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
