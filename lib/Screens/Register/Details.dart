// ignore_for_file: file_names, unnecessary_import, implementation_imports, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Center(child: Text("Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300))), backgroundColor: Colors.white,elevation: 0.1,),
      body: DetailsFields(),
    );
  }
}
