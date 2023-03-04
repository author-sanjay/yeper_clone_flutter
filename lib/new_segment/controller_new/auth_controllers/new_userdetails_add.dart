import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../../utils/const_url.dart';
import '../../new_screens/navbar_new_screen.dart';

class UserDetailsAddController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  Random _rnd = Random();
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<void> adduser(
      String name, String email, String passward, referralof,BuildContext context) async {
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);

    _dialog.show(message: "Loading...");

    Map<String, String> headers = {"Content-type": "application/json"};
    var json = jsonEncode({
      "uid": user?.uid,
      "name": name,
      "email": email,
      "phonenumber": user?.phoneNumber,
      "referalcode": getRandomString(6).toUpperCase(),
      "password": passward,
      "referralof": referralof.toString()
    }); 

    var res = await http
        .post(Uri.parse(ConstUrl.baseUrl + "/user/add"),
            headers: headers, body: json)
        .then((value) async {
      try {
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

        if (res.statusCode == 200) {
          _dialog.hide();
          Get.to(() => NavbarNewScreen());
        } else {
          _dialog.hide();
          Get.showSnackbar(GetSnackBar(
            title: "Error",
            message: "Something went wrong",
            duration: const Duration(seconds: 3),
          ));
        }
      } catch (e) {
        _dialog.hide();
        Get.showSnackbar(GetSnackBar(
          title: "Error",
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ));
      }
    });
  }
}
