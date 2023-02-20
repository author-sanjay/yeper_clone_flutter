import 'package:get/get.dart';

import 'auth_controller.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  void phoneAuthentication(String phoneNo) {
    AuthController.instance.phoneAuthentication(phoneNo);
  }
}
