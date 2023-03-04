import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeper_user/new_segment/new_screens/login_screen_new.dart';

import '../../new_models/deals_models/get_all_deals_model.dart';
import '../../utils/const_url.dart';

class GetAllDealsController extends GetxController {
  var getAllDealsModelList = <GetAllDealsModel>[].obs;

  Future<void> getAllDeals() async {
    final _url = Uri.parse(ConstUrl.baseUrl + ConstUrl.getDealEndPoint);

    final prefs = await SharedPreferences.getInstance();

    final _token = prefs.getString("token");

    if (_token == null) {
      Get.offAll(LoginNewScreen());
    }

   

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + _token!,
    };

    var res = await http.get(_url, headers: headers);

    List<GetAllDealsModel> getNewDealsModelList = [];

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      for (var item in data) {
        var d = GetAllDealsModel.fromJson(item);

        getNewDealsModelList.add(d);
      }

      getAllDealsModelList.value = getNewDealsModelList;
    } else if (res.statusCode == 403) {
      Get.to(() => LoginNewScreen());
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
