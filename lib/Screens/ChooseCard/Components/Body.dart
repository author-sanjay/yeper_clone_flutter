// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/ChooseCard/Components/Header.dart';
import 'package:yeper_user/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              HeaderWithSearchbar(size: size),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300 
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text("Visa\n",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
                      Text("XXXX XXXX XXXX",style: TextStyle(fontSize: 20),),
                    ]
                  ),
                ),
              )
            ],
          ),
        )
      
    );
  }
}