
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  Future<void> verifyOTP(String otp, BuildContext context) async {
    var isVerified = await AuthController.instance.verifyOtp(otp, context);
  }
}
