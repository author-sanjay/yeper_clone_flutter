// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/ChooseCard/ChooseCard.dart';
import 'package:yeper_user/Screens/EditProfile/EditProfile.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/ProfilePage/Profile.dart';
import 'package:yeper_user/Screens/Referal/Referal.dart';
import 'package:yeper_user/Screens/ReferalList/ReferralList.dart';
import 'package:yeper_user/Screens/Wallet/Wallet.dart';

import 'package:yeper_user/constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yeper Client",
      theme: ThemeData(
        scaffoldBackgroundColor: kbackgroundColor,
        primaryColor: kprimarycolor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: EditProfile(),
      
    );
  }
}
