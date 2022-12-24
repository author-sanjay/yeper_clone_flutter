// ignore_for_file: prefer_const_constructors, file_names, avoid_print, sized_box_for_whitespace, unused_import

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
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: widget.size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            height: widget.size.height * 0.2 - 27,
            decoration: BoxDecoration(
                color: kprimarycolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              }),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: MediaQuery.of(context).size.width * 0.05),
                child: Container(
                  child: Row(
                    children: [
                      Column(
                        children: <Widget>[
                          Text(
                            "Welcome",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                          ),
                          Text(
                            user.name.toString().toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                          ),
                        ],
                      ),
                      Spacer(),
                      user.photo?.length==0?
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.05),
                        child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.10,
                            backgroundImage:
                                AssetImage("assets/images/image_1.png")),
                      ): Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.10,
                                  backgroundImage:
                                      NetworkImage(user.photo.toString()),
                            ),)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kprimarycolor.withOpacity(0.23)),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search Card",
                          hintStyle:
                              TextStyle(color: kprimarycolor.withOpacity(0.5)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SvgPicture.asset("assets/icons/search.svg")
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
