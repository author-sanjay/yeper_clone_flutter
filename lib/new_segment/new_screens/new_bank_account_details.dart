import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../reusable_widget/reusable_button.dart';
import '../reusable_widget/reusable_underline_textfield.dart';

class BankDetailsPage extends StatefulWidget {
  const BankDetailsPage({super.key});

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
  TextEditingController _accountcontroller = TextEditingController();
  TextEditingController _accountnumbercontroller = TextEditingController();
  TextEditingController _ifsccodecontroller = TextEditingController();
  TextEditingController _banknamecontroller = TextEditingController();
  TextEditingController _upiidcontroller = TextEditingController();
  TextEditingController _pancontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C2039),
        leading: Image.asset(
          "assets/images/back.png",
          scale: 5,
        ),
        title: Text(
          " Bank Account",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          ReusableUnderlineTextfield(title: "Account Holder name", controller: _accountcontroller),
          SizedBox(
            height: 16,
          ),
          ReusableUnderlineTextfield(
             title: "Account number", controller: _accountnumbercontroller),
          SizedBox(
            height: 16,
          ),
          ReusableUnderlineTextfield(title: "IFSC CODE",controller: _ifsccodecontroller),
          SizedBox(
            height: 16,
          ),
          ReusableUnderlineTextfield(  title: "Bank name", controller: _banknamecontroller,),
          SizedBox(
            height: 16,
          ),
          ReusableUnderlineTextfield( title: "Upi Id", controller: _upiidcontroller,),
          SizedBox(
            height: 16,
          ),
          ReusableUnderlineTextfield( title: "Pan Number", controller: _pancontroller,),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ReusableButton(
              text: "Save Account Details",
              onTap: () {},
            ),
          )
        ]),
      ),
    );
  }
}
