import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../new_models/user_details_get_model.dart';

import 'package:http/http.dart' as http;

import '../../utils/const_url.dart';

class UserDetailsController extends GetxController {
  var userDetailsModel = UserDetailsModel().obs;
  final _url = Uri.parse(ConstUrl.baseUrl +
      ConstUrl.getUserDetails +
      (FirebaseAuth.instance.currentUser?.uid).toString());
  Future<void> getuser() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final _token = prefs.getString("token");
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + _token!,
      };
      var res = await http.get(_url, headers: headers);
      var result = jsonDecode(res.body);
      if (res.statusCode == 200) {
      
        userDetailsModel.value = UserDetailsModel.fromJson(result);
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: "Error",
            message: "Something Went Wrong",
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Error",
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
