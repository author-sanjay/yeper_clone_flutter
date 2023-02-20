import 'package:get/get.dart';


import '../controller_new/auth_controllers/auth_controller.dart';
import '../controller_new/auth_controllers/otp_controller.dart';
import '../controller_new/auth_controllers/signup_controller.dart';
import '../controller_new/deals_controllers/get_all_deals_controller.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<OTPController>(() => OTPController(), fenix: true);
    Get.lazyPut<GetAllDealsController>(() => GetAllDealsController(),
        fenix: true);
  }
}
