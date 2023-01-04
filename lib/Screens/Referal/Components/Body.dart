// ignore_for_file: prefer_const_constructors, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/ReferalList/ReferralList.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              SvgPicture.asset("assets/icons/referal.svg",fit: BoxFit.contain,height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.height * 0.8,
              ),
              Text("Refer and Earn More",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
              Text(" "),
              Text("Earn 10% on Every Deal of Your Referrals\n",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              
              
            ),
            Text("Your Referal Code is:\n ",style: TextStyle(fontSize: 20),),
            Text(user.referalcode.toString().toUpperCase(),style: TextStyle(fontSize: 35),),
            GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReferralList()
                  ),
                );
              }),
              child: Container(
                height: 50,
                
                width:MediaQuery.of(context).size.width * 0.6,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
                decoration: BoxDecoration(
                  color: kprimarycolor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(child: Text("See Your Referrals",style: TextStyle(fontSize: 20,color: Colors.white),)),
              ),
            )
            ],
          ),
        ),
      )
    );
  }
}