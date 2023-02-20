import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/api.dart';
import 'package:yeper_user/constants.dart';
import 'package:http/http.dart' as http;

class PasswordLogin extends StatefulWidget {
  const PasswordLogin({super.key});
  static late String password;
  static late String token;
  @override
  State<PasswordLogin> createState() => _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ,
      body: body(),
    );
  }
}

class body extends StatelessWidget {
  const body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String password = "";
    Future<void> auth(String password) async {
      Map<String, String> headers = {"Content-type": "application/json"};
      print(FirebaseAuth.instance.currentUser?.uid.toString());
      var json = jsonEncode({
        "uid": FirebaseAuth.instance.currentUser?.uid.toString(),
        "password": password
      });
      var res = await http.post(Uri.parse(api + "/user/authenticate"),
          body: json, headers: headers);
      // print(res.statusCode);
      // print(res.body);
      print(res.toString());
      PasswordLogin.token = res.body;
      // print(res.statusCode);
      if (res.statusCode == 403) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasswordLogin(),
          ),
        );
      } else {
        var result = res.body;
        user.token = result;
        print(result);
        print(user.token);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    }

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Container(
                    alignment: Alignment.center,
                    child:
                        Image(image: AssetImage("assets/images/2factor.png"))),
              )),
              Center(
                child: Text(
                  "One More Step",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(
                  child: Text(
                    "Please Verify Your Password",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      onChanged: (value) {
                        password = value;
                        PasswordLogin.password = value;
                        print(PasswordLogin.password);
                      },
                      decoration: const InputDecoration(labelText: "Password"),
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => {auth(password.toString())},
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(color: kprimarycolor),
                    child: Center(
                      child: Text(
                        "Log Me In",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
