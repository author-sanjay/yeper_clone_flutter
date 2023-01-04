// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/ChooseCard/AddCard.dart';
import 'package:yeper_user/Screens/ChooseCard/Components/Body.dart';
import 'package:yeper_user/constants.dart';

class ChooseCard extends StatelessWidget {
  const ChooseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: kprimarycolor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
        child: GestureDetector(
            onTap: (() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddCards()));
            }),
            child: Text(
              "Add New Card",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
