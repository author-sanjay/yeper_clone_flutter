import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yeper_user/constants.dart';

class DetailsFields extends StatelessWidget {
  const DetailsFields({super.key});
  static var name;
  static var email;
  static var address;
  static var bankaccount;
  static var bankname;
  static var ifsc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Center(
              child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Text(
              "We See...\n You are a new User\n",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Text(
              "So Lets Build your profile",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      DetailsFields.name = value;
                    },
                    decoration: new InputDecoration(labelText: "Name"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      DetailsFields.email = value;
                    },
                    decoration: new InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      // phone_number = value;
                      DetailsFields.address = value;
                    },
                    decoration: new InputDecoration(labelText: "Address"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      DetailsFields.bankaccount = value;
                    },
                    decoration: new InputDecoration(labelText: "Bank Account"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      DetailsFields.bankname = value;
                    },
                    decoration: new InputDecoration(labelText: "Bank Name"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      DetailsFields.ifsc = value;
                    },
                    decoration: new InputDecoration(labelText: "IFSC"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: kprimarycolor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    )),
                  )
                ],
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
