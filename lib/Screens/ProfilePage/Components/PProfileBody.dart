// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yeper_user/constants.dart';


class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(child: 
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  CircleAvatar(backgroundImage: AssetImage("assets/images/logo.png"),radius: MediaQuery.of(context).size.width*0.15,),
                  SizedBox(height:20),
                  Text("Sanjay Kumar",style: TextStyle(fontSize: 25),),
                  SizedBox(height:20),
                  Container(height: 23, decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)
                  ), child: Text(" Edit Profile ",style: TextStyle(fontSize: 17),),),
                  SizedBox(height: 20,),
                  
                  Container(
                    
                    color: kbackgroundColor,
                    child: List(),
            ),
          
                ],
              ),),),
      ),
    ),);
  }
}

class List extends StatelessWidget {
  const List({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        
      GestureDetector(
        onTap: (() {
          
        }),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child:Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Transaction",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            
          ],
        )
        ),
      ),
      GestureDetector(
        onTap: (() {}),
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Offers",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
      GestureDetector(
        onTap: (() {}),
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Referrals",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
     GestureDetector(
        onTap: (() {}),
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Wallet",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      ), GestureDetector(
        onTap: (() {}),
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Help & Support",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
      GestureDetector(
        onTap: (() {
          
        }),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child:Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Contact Us",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            
          ],
        )
        ),
      ),
                  
                  
                  
                ],
              );
  }
}