// ignore_for_file: file_names, prefer_typing_uninitialized_variables, sized_box_for_whitespace, prefer_const_constructors, unused_local_variable

import 'dart:convert';
import 'dart:math';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/Register/Registerfields.dart';
import 'package:yeper_user/api.dart';
import 'package:yeper_user/constants.dart';
import 'package:http/http.dart' as http;
import 'package:yeper_user/modals/UserModal.dart';

import 'RegisterVerify.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

Users user = new Users();

// final FirebaseAuth auth = FirebaseAuth.instance;
// User user=new User(acnumber, address, wallet, bankname, email, id, idfc, name, phonenumber, referalcode, referedby)
class DetailsFields extends StatefulWidget {
  const DetailsFields({super.key});
  static var name;
  static var email;
  static var address;
  static var bankaccount;
  static var bankname;
  static var ifsc;
  static var referal;

  @override
  State<DetailsFields> createState() => _DetailsFieldsState();
}

class _DetailsFieldsState extends State<DetailsFields> {
  @override
  Widget build(BuildContext context) {
    Future<void> adduser() async {
      Map<String, String> headers = {"Content-type": "application/json"};
      var json = jsonEncode({
        "uid": RegisterVerify.uid,
        "name": DetailsFields.name,
        "email": DetailsFields.email,
        "phonenumber": Registerfields.phone_number,
        "address": DetailsFields.address,
        "acnumber": int.parse(DetailsFields.bankaccount),
        "bankname": DetailsFields.bankname,
        "idfc": DetailsFields.ifsc,
        "referalCode": getRandomString(6)
      });
      var res = await http.post(Uri.parse(api + "/user/add"),
          headers: headers, body: json);
      var result = jsonDecode(res.body);
      Provider.of<Users>(context, listen: false).signin(
          RegisterVerify.uid,
          DetailsFields.name,
          DetailsFields.email,
          result["phonenumber"],
          DetailsFields.address,
          result["referalCode"],
          "referedby",
          result["acnumber"],
          DetailsFields.bankname,
          // 1,
          DetailsFields.ifsc);

      // user.acnumber = result["acnumber"];
      // user.address = DetailsFields.address;
      // user.wallet = int.parse(result["wallet"]);
      // user.bankname = DetailsFields.bankname;
      // user.email = DetailsFields.email;
      // user.id = result["uid"];
      // user.idfc = DetailsFields.ifsc;
      // user.name = DetailsFields.name;
      // user.phonenumber = result["phonenumber"];
      // user.referalcode = result["referalCode"];
      // user.referedby = "referedby";

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }

    return SingleChildScrollView(
      child: SafeArea(
          child: Center(
              child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Text(
              "We See...\n You are a new User\n",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Text(
              "So Lets Build your profile",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      DetailsFields.name = value;
                    },
                    decoration: const InputDecoration(labelText: "Name"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      DetailsFields.email = value;
                    },
                    decoration: const InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      // phone_number = value;
                      DetailsFields.address = value;
                    },
                    decoration: const InputDecoration(labelText: "Address"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      DetailsFields.bankaccount = value;
                    },
                    decoration:
                        const InputDecoration(labelText: "Bank Account"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      DetailsFields.bankname = value;
                    },
                    decoration: const InputDecoration(labelText: "Bank Name"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      DetailsFields.ifsc = value;
                    },
                    decoration: const InputDecoration(labelText: "IFSC"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      DetailsFields.referal = value;
                    },
                    decoration:
                        const InputDecoration(labelText: "Referal Code"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        adduser();
                      });
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
      ))),
    );
  }
}
