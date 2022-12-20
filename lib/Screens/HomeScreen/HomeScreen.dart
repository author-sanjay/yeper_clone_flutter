// ignore_for_file: prefer_const_constructors, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/Body.dart';
import 'package:yeper_user/Screens/ProfilePage/Components/PProfileBody.dart';
import 'package:yeper_user/constants.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        elevation: 0,
      ),
      body: Body(),
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
