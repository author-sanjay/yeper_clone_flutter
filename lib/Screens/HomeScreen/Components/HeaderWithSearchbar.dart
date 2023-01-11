// ignore_for_file: prefer_const_constructors, file_names, avoid_print, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/ProfilePage/Profile.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/Screens/Wallet/Wallet.dart';
import 'package:http/http.dart' as http;
import '../../../api.dart';
import '../../../constants.dart';

class HeaderWithSearchbar extends StatefulWidget {
  const HeaderWithSearchbar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<HeaderWithSearchbar> createState() => _HeaderWithSearchbarState();
}

class _HeaderWithSearchbarState extends State<HeaderWithSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.1 - 37),
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
          color: kprimarycolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
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
      child: Padding(
        padding: const EdgeInsets.only(
            left: kDefaultPadding, right: kDefaultPadding),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.photo.toString()),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Hi,  ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              user.name.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile())
                  );
                },
                child: Container(child: Icon(Icons.menu, color: Colors.white,)))
          ],
        ),
      ),
    );
  }
}
