import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import 'auth_controller.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  void phoneAuthentication(String phoneNo, BuildContext context) {
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    // _dialog.show(message: "Verifying Number...");
    AuthController.instance.phoneAuthentication(phoneNo, context);
  }
}
