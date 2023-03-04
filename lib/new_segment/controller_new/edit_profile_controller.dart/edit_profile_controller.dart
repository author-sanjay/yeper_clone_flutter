import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/const_url.dart';

class EditProfileController extends GetxController {
  Future<void> updateProfile(
    String? email,
    String? phonenumber,
    String? ac,
    String? bankname,
    String? idfc,
    String? photo,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final _token = prefs.getString("token");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + _token!,
    };

    // Map<String, String> body = {
    //   "email": email.toString(),
    //   "phonenumber": phonenumber.toString(),
    //   "acnumber": ac.toString(),
    //   "bankname": bankname.toString(),
    //   "idfc": idfc.toString(),
    //   "photo": photo.toString()
    // };
    final json = jsonEncode({
      "email": email,
      "phonenumber": phonenumber,
      "acnumber": ac,
      "bankname": bankname,
      "idfc": idfc,
      "photo": photo.toString()
    });

    final _url = Uri.parse(ConstUrl.baseUrl +
        ConstUrl.Editprofile +
        (FirebaseAuth.instance.currentUser?.uid).toString());
    print(_url);
    try {
      final response = await http.put(_url, body: json, headers: headers);
      if (response.statusCode == 200) {
        print(response.body);
        Get.showSnackbar(
          GetSnackBar(
            title: "Success",
            message: "SuccessFully Update!",
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: "Error",
            message: "Something Wen't Wrong",
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
