// ignore_for_file: prefer_const_constructors, file_names, camel_case_types, prefer_interpolation_to_compose_strings, avoid_print, annotate_overrides, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/ChooseCard/ChooseCard.dart';
// import 'package:flutterkeylogger/flutterkeylogger.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/Body.dart';
import 'package:yeper_user/Screens/LoginScreen/Components/PasswordLogin.dart';
import 'package:yeper_user/Screens/OrderList/OrderList.dart';
import 'package:yeper_user/Screens/ProfilePage/Components/PProfileBody.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/Screens/Register/Register.dart';
import 'package:yeper_user/Screens/Wallet/Wallet.dart';
import 'package:yeper_user/constants.dart';
import 'package:http/http.dart' as http;

import '../../api.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var logs = [];
  late String? uid;
  bool isloading = true;
  Future<void> gettinguser() async {
    String token = user.token.toString();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + PasswordLogin.token,
    };
    var res = await http.get(
        Uri.parse(api + "/user/getsingle/" + uid.toString()),
        headers: headers);

    var result = jsonDecode(res.body);
    print(result);

    try {
      user.id = result["uid"];
      print(user.id);
    } catch (e) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Register(),
        ),
      );
    }
    try {
      user.name = result["name"];

      print(user.name);
    } catch (e) {
      print(e);
    }
    try {
      user.email = result["email"];
      print(user.email);
    } catch (e) {
      print(e);
    }
    try {
      user.phonenumber = result["phonenumber"];
      print(user.phonenumber);
    } catch (e) {
      print(e);
    }
    try {
      user.address = result["address"];
      print(user.address);
    } catch (e) {
      print(e);
    }

    try {
      user.referalcode = result["referalCode"];
      print(user.referalcode);
    } catch (e) {
      print(e);
    }
    try {
      user.referedby = result["referralof"];
      print(user.referedby);
    } catch (e) {
      print(e);
    }

    try {
      user.acnumber = result["acnumber"];
      print(user.acnumber);
    } catch (e) {
      print(e);
    }
    try {
      user.bankname = result["bankname"];
      print(user.bankname);
    } catch (e) {
      print(e);
    } // result["wallet"]  ,

    try {
      user.idfc = result["idfc"];
    } catch (e) {
      print(e);
    }

    try {
      user.photo = result["photo"];
      print(user.photo);
    } catch (e) {
      print(e);
    }
    user.token = PasswordLogin.token;

    setState(() {
      isloading = false;
    });
  }

  void initState() {
    super.initState();

    uid = FirebaseAuth.instance.currentUser?.uid;
    gettinguser();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: ((value) => {print(value)}),
      child: Scaffold(
          body: isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Body(),
          // drawer: drawer(),
          bottomNavigationBar: bottomnavbar()),
    );
  }
}

class bottomnavbar extends StatelessWidget {
  const bottomnavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(
          left: kDefaultPadding, right: kDefaultPadding, top: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 239, 239),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 108, 106, 106),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 30.0,
              spreadRadius: 2.0,
            ),
          ]),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Container(
              child: Column(
                children: [Image.asset("assets/images/home.png"), Text("Home")],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OrderList()),
              );
            },
            child: Container(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/orders.png",
                  ),
                  Text("Orders")
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseCard(),
                ),
              );
            },
            child: Container(
              child: Column(
                children: [
                  Image.asset("assets/images/cards.png"),
                  Text("Cards")
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WalletScreen()),
              );
            },
            child: Container(
              child: Column(
                children: [
                  Image.asset("assets/images/wallet.png"),
                  Text("Wallet")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: ProfileBody(key: key),
    );
  }
}
