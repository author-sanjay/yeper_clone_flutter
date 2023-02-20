import 'package:flutter/material.dart';

import '../controller_new/auth_controllers/new_userdetails_add.dart';
import '../reusable_widget/reusable__textfield.dart';
import '../reusable_widget/reusable_button.dart';

class LoginDetailNewScreen extends StatefulWidget {
  const LoginDetailNewScreen({super.key});

  @override
  State<LoginDetailNewScreen> createState() => _LoginDetailNewScreenState();
}

class _LoginDetailNewScreenState extends State<LoginDetailNewScreen> {
  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _emailIdController = TextEditingController();
  TextEditingController _referralController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailIdController.dispose();
    _referralController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
                "Enter your detail",
                style: TextStyle(
                  color: Color(0xff212223),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "If you change your detail it will update in\nyour profile",
                style: TextStyle(
                  color: Color(0xff8A8B8F),
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              ReusbleTextField(
                controller: _firstNameController,
                hint: 'First Name',
              ),
              SizedBox(
                height: 12,
              ),
              ReusbleTextField(
                controller: _emailIdController,
                hint: 'Email ID',
              ),
              SizedBox(
                height: 12,
              ),
              ReusbleTextField(
                controller: _passwordController,
                hint: 'Password',
              ),
              SizedBox(
                height: 12,
              ),
              ReusbleTextField(
                controller: _referralController,
                hint: 'Referral Code',
              ),
              Spacer(
                flex: 2,
              ),
              ReusableButton(
                text: "Next",
                onTap: _next,
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _next() {
    if (_formKey.currentState!.validate()) {
      UserDetailsAddController().adduser(
          _firstNameController.text,
          _emailIdController.text,
          _passwordController.text,

          context);
    }
  }
}
