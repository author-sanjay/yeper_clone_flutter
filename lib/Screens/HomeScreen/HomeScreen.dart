// ignore_for_file: prefer_const_constructors, file_names

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/Body.dart';
import 'package:yeper_user/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      drawer: Drawer(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kprimarycolor,
      elevation: 0,
      leading: IconButton(
          onPressed: (() => {}),
          // onPressed: () => Scaffold.of(context).openDrawer(),
          icon: SvgPicture.asset("assets/icons/menu.svg")),
    );
  }
}
