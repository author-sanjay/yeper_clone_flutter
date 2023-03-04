import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:yeper_user/new_segment/utils/const_url.dart';

class BankDetailsKyc extends GetxController {
  final _url = Uri.parse(ConstUrl.baseUrl + ConstUrl.managekyc);
  Future<void> update1(
    String accountholdername,
    String upiid,
    String pan,
    String ac,
    String bank,
    String ifsc,
  ) async {
    final json = jsonEncode({
      "uid": (FirebaseAuth.instance.currentUser?.uid).toString(),
      "accountholdername": accountholdername,
      "upi": upiid,
      "pan": pan,
      "acnumber": ac,
      "bankname": bank,
      "idfc": ifsc,
    });
 
    final prefs = await SharedPreferences.getInstance();

    final _token = prefs.getString("token");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + _token!,
    };

    var res = await http.post(_url, headers: headers, body: json);
 

    if (res.statusCode == 200) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Success",
          message: "Update Successfully!",
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: "Success",
          message: "Something Wen't Wrong",
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
