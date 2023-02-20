import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../utils/const_url.dart';
import '../../new_screens/navbar_new_screen.dart';

class logincontroller extends GetxController {
  login(String passward, BuildContext context) async {
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    try {
      _dialog.show(message: "Checking Password...");
      Map<String, String> headers = {"Content-type": "application/json"};
      print(FirebaseAuth.instance.currentUser?.uid.toString());
      var json = jsonEncode({
        "uid": FirebaseAuth.instance.currentUser?.uid.toString(),
        "password": passward
      });
      var res = await http.post(
          Uri.parse(ConstUrl.baseUrl + "/user/authenticate"),
          body: json,
          headers: headers);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", res.body);
      print(prefs.getString("token"));
      print(res.statusCode);
      print(res.body);

      if (res.statusCode == 200) {
        _dialog.hide();
        Get.to(() => NavbarNewScreen());
      } else {
        _dialog.hide();
        Get.showSnackbar(
          GetSnackBar(
            title: "Error",
            message: "Password is wrong",
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      _dialog.hide();
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: e.toString(),
        duration: const Duration(seconds: 3),
      ));
    }
  }
}
