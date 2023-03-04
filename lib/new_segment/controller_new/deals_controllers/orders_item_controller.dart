import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:yeper_user/new_segment/new_models/deals_models/order_item_model.dart';
import 'package:http/http.dart' as http;
import '../../new_models/deals_models/get_all_deals_model.dart';
import '../../utils/const_url.dart';

class OrderItemController extends GetxController {
  var orderItemModel = OrderItemModel().obs;
  Future<void> orderItem(
      GetAllDealsModel item, int orderId, BuildContext context) async {
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    try {
      _dialog.show(message: "Loading...");
      final _url = Uri.parse(ConstUrl.baseUrl +
          "/orders/add/" +
          (FirebaseAuth.instance.currentUser?.uid).toString() +
          "/" +
          item.id.toString());

      final prefs = await SharedPreferences.getInstance();
      final _token = prefs.getString("token");

      DateTime today = DateTime.now();
      String dateStr = "${today.day}-${today.month}-${today.year}";

      final body = jsonEncode({
        "status": "Placed",
        "platformtxnid": orderId,
        "product": item.name,
        "date": dateStr,
        "deal": item.id,
      });

      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + _token!,
      };
      var res = await http.post(_url, headers: headers, body: body);
      var result = jsonDecode(res.body);
      if (res.statusCode == 200) {
        print(res.body.toString());
        orderItemModel.value = OrderItemModel.fromJson(result);
        _dialog.hide();
      } else {
          _dialog.hide();
        Get.showSnackbar(
          GetSnackBar(
            title: "Error",
            message: "Something Went Wrong",
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
        _dialog.hide();
      print(e);
    }
  }
}
