import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../controller_new/auth_controllers/enter_login_controller.dart';
import '../reusable_widget/reusable__textfield.dart';
import '../reusable_widget/reusable_button.dart';

class EnterPasswordNewScreen extends StatefulWidget {
  const EnterPasswordNewScreen({super.key});

  @override
  State<EnterPasswordNewScreen> createState() => _EnterPasswordNewScreenState();
}

class _EnterPasswordNewScreenState extends State<EnterPasswordNewScreen> {
  TextEditingController _passwordController = TextEditingController();

  void _submit() {
    logincontroller().login(_passwordController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: 96.h,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("assets/images/2factor.png"),
                    ),
                  ),
                )),
                Center(
                  child: Text(
                    "One More Step",
                    style: TextStyle(
                      color: Color(0xff212223),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Please Verify Your Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Spacer(),
                ReusbleTextField(
                    hint: "Passowrd", controller: _passwordController),
                Spacer(),
                ReusableButton(text: "Submit", onTap: _submit),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
