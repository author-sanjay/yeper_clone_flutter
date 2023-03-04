import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeper_user/new_segment/new_models/referal_model.dart';
import 'package:http/http.dart' as http;
import '../utils/const_url.dart';

class RefferalController extends GetxController {
  var getRefferalList = <ReferalModel>[].obs;

  Future<void> getReffereal() async {
    final prefs = await SharedPreferences.getInstance();
    final _url = Uri.parse(ConstUrl.baseUrl +
        ConstUrl.referEndPoint +
        (FirebaseAuth.instance.currentUser?.uid).toString());

    final _token = prefs.getString("token");
    print("object");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + _token!,
    };

    var res = await http.get(_url, headers: headers);

    List<ReferalModel> newOrderList = [];

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      for (var item in data) {
        var d = ReferalModel.fromJson(item);
        newOrderList.add(d);
      }
      getRefferalList.value = newOrderList;
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
