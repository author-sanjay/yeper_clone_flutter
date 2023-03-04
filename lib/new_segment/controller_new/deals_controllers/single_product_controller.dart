import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../new_models/deals_models/single_product_model.dart';
import '../../utils/const_url.dart';
import 'package:http/http.dart' as http;

class SingleProductController extends GetxController {
  var singleProductModel = SingleProductModel().obs;
  var listOfDiscount = <SingleProductModel>[].obs;
    
  Future<SingleProductModel> getSingleProduct(int id) async {
    final _url =
        Uri.parse(ConstUrl.baseUrl + ConstUrl.getSingleItem + id.toString());

    // try {
    final prefs = await SharedPreferences.getInstance();

    final _token = prefs.getString("token");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + _token!,
    };
    var res = await http.get(_url, headers: headers);
    var result = jsonDecode(res.body);
    if (res.statusCode == 200) {
      singleProductModel.value = SingleProductModel.fromJson(result);
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: "Error",
          message: "Something Went Wrong",
          duration: const Duration(seconds: 3),
        ),
      );
    }

    return singleProductModel.value;
    // }
    //  catch (e) {
    //   Get.showSnackbar(
    //     GetSnackBar(
    //       title: "Error",
    //       message: e.toString(),
    //       duration: const Duration(seconds: 3),
    //     ),
    //   );
    // }
  }

   

}
