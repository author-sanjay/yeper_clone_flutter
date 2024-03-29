// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeper_user/Screens/SplashScreen/SplashScreen.dart';
import 'package:yeper_user/constants.dart';
import 'package:yeper_user/modals/UserModal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<Users>(
      create: (context) => Users(),
      child:
          Consumer<Users>(builder: ((context, provider, child) => MyApp()))));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late final String? uid;
  @override
  void initState() {
    super.initState();
    // uid = FirebaseAuth.instance.currentUser?.uid;
    // uid = null;
  }

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
      home: SplashScreen(),
    );
  }
}
