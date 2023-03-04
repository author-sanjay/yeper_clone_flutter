import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/new_segment/new_models/user_details_get_model.dart';
import 'package:yeper_user/new_segment/new_screens/navbar_new_screen.dart';

import '../controller_new/manage_kyc_controller/bank_details_kyc.dart';
import '../reusable_widget/reusable_button.dart';
import '../reusable_widget/reusable_underline_textfield.dart';
import '../utils/utils.dart';

class BankDetailsPage extends StatefulWidget {
  final UserDetailsModel getUserInfo;
  const BankDetailsPage({
    super.key,
    required this.getUserInfo,
  });

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
  TextEditingController _accountnumbercontroller = TextEditingController();
  TextEditingController _accountholdernamecontroller = TextEditingController();
  TextEditingController _ifsccodecontroller = TextEditingController();
  TextEditingController _banknamecontroller = TextEditingController();
  TextEditingController _upiidcontroller = TextEditingController();
  TextEditingController _pancontroller = TextEditingController();

  _sumbit() async {
    await BankDetailsKyc().update1(
      _accountholdernamecontroller.text,
      _upiidcontroller.text,
      _pancontroller.text,
      _accountnumbercontroller.text,
      _banknamecontroller.text,
      _ifsccodecontroller.text,
    );

    Get.offAll(() => NavbarNewScreen());
  }

  @override
  void initState() {
    _accountholdernamecontroller.text =
        getFormatedString(widget.getUserInfo.name);
    _pancontroller.text = getPhoneString(widget.getUserInfo.pan);
    _accountnumbercontroller.text =
        getFormatedString(widget.getUserInfo.acnumber);
    _banknamecontroller.text = getFormatedString(widget.getUserInfo.bankname);
    _ifsccodecontroller.text = getFormatedString(widget.getUserInfo.idfc);

    super.initState();
  }

 
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C2039),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/back.png",
            scale: 5,
          ),
        ),
        title: Text(
          " Bank Account",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            ReusableUnderlineTextfield(
                title: "Account Holder name",
                controller: _accountholdernamecontroller),
            SizedBox(
              height: 16,
            ),
            ReusableUnderlineTextfield(
                title: "Account number", controller: _accountnumbercontroller),
            SizedBox(
              height: 16,
            ),
            ReusableUnderlineTextfield(
                title: "IFSC CODE", controller: _ifsccodecontroller),
            SizedBox(
              height: 16,
            ),
            ReusableUnderlineTextfield(
              title: "Bank name",
              controller: _banknamecontroller,
            ),
            SizedBox(
              height: 16,
            ),
            ReusableUnderlineTextfield(
              title: "Upi Id",
              controller: _upiidcontroller,
            ),
            SizedBox(
              height: 16,
            ),
            ReusableUnderlineTextfield(
              title: "Pan Number",
              controller: _pancontroller,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ReusableButton(
                text: "Save Account Details",
                onTap: () {
                  _sumbit();
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
