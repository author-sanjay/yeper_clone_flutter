import 'package:get/get.dart';
import 'package:yeper_user/new_segment/controller_new/auth_controllers/user_details_controller.dart';
import 'package:yeper_user/new_segment/controller_new/deals_controllers/add_otp_controller.dart';
import 'package:yeper_user/new_segment/controller_new/deals_controllers/order_list_controller.dart';
import 'package:yeper_user/new_segment/controller_new/deals_controllers/orders_item_controller.dart';
import 'package:yeper_user/new_segment/controller_new/image_picker_controller.dart';

import '../controller_new/auth_controllers/auth_controller.dart';
import '../controller_new/auth_controllers/otp_controller.dart';
import '../controller_new/auth_controllers/signup_controller.dart';
import '../controller_new/deals_controllers/get_all_deals_controller.dart';
import '../controller_new/deals_controllers/single_product_controller.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<OTPController>(() => OTPController(), fenix: true);
    Get.lazyPut<GetAllDealsController>(() => GetAllDealsController(),
        fenix: true);
    Get.lazyPut<GetAllDealsController>(() => GetAllDealsController(),
        fenix: true);
    Get.lazyPut<UserDetailsController>(() => UserDetailsController(),
        fenix: true);
    Get.lazyPut<ImagePickerController>(() => ImagePickerController(),
        fenix: true);
    Get.lazyPut<OrderItemController>(() => OrderItemController(), fenix: true);
    Get.lazyPut<OrderListController>(() => OrderListController(), fenix: true);
    Get.lazyPut<SingleProductController>(() => SingleProductController(),
        fenix: true);
    Get.lazyPut<AddOTPController>(() => AddOTPController(), fenix: true);
  }
}
