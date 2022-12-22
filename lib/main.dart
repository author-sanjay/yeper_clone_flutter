// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeper_user/Screens/Register/Details.dart';
import 'package:yeper_user/Screens/Register/Register.dart';

import 'package:yeper_user/constants.dart';
import 'package:yeper_user/modals/UserModal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Users())],
      child: MyApp()));
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
        home: Register());
  }
}
