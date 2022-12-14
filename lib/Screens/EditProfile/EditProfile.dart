import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/EditProfile/ProfileBody.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileBody(),
    );
  }
}