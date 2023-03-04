import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:yeper_user/new_segment/new_models/deals_models/order_list_model.dart';
import '../../utils/const_url.dart';

class OrderListController extends GetxController {

      var getOrderList = <OrderListModel>[].obs;
    
    Future<void> getOrders()
    async {
    final prefs = await SharedPreferences.getInstance();
    final _url = Uri.parse(ConstUrl.baseUrl + ConstUrl.orderListEndPoint+  (FirebaseAuth.instance.currentUser?.uid).toString());


      final _token = prefs.getString("token");

    
    

      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + _token!,
      };

      var res = await http.get(_url, headers: headers);

      List<OrderListModel> newOrderList = [];

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        for (var item in data) {
          var d = OrderListModel.fromJson(item);
          newOrderList.add(d);
        }
        getOrderList.value = newOrderList;
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: "Error",
            message: 'Something Went Wrong ${res.statusCode}',
            duration: const Duration(seconds: 3),
          ),
        );
      } 
   }

}
