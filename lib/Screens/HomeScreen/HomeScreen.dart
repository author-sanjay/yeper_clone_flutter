// ignore_for_file: prefer_const_constructors, file_names, camel_case_types

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/Body.dart';
import 'package:yeper_user/Screens/ProfilePage/Components/PProfileBody.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/constants.dart';
import 'package:http/http.dart' as http;
import 'package:yeper_user/main.dart';
import 'package:yeper_user/modals/UserModal.dart';

import '../../api.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String? uid;
  bool isloading = true;
  Future<void> gettinguser() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.get(
        Uri.parse(api + "/user/getsingle/" + uid.toString()),
        headers: headers);

    var result = jsonDecode(res.body);
    print(result);

    try {
      user.id = result["uid"];
      print(user.id);
    } catch (e) {
      print(e);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        elevation: 0,
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Body(),
      drawer: drawer(),
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
