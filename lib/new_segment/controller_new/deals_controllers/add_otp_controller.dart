import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeper_user/new_segment/new_models/deals_models/add_otp_model.dart';
import 'package:http/http.dart' as http;
import '../../utils/const_url.dart';

class AddOTPController extends GetxController {
  var addOTPModel = AddOTPModel().obs;

  Future<void> getUpdate(
    String? status,
    String? phonenumberr,
    String? courier,
    String? otp,
    String orderId,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final _token = prefs.getString("token");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + _token!,
    };

    final json = jsonEncode({
      "phonenumberr": phonenumberr,
      "status": status,
      "courier": courier,
      "otp": otp,
    });

 

    final _url =
        Uri.parse(ConstUrl.baseUrl + "/orders/updatesingle/${orderId}");

    try {
      final response = await http.post(_url, body: json, headers: headers);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        addOTPModel.value = AddOTPModel.fromJson(data);
        Get.showSnackbar(
          GetSnackBar(
            title: "Success",
            message: "SuccessFully Updated!",
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
