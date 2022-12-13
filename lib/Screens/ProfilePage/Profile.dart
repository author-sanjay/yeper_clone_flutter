import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/ProfilePage/Components/PProfileBody.dart';
import 'package:yeper_user/constants.dart';
import 'package:yeper_user/main.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kprimarycolor, elevation: 0.3,centerTitle: true,title: Text("My Profile"),),
      body: ProfileBody(),
    );
  }
}