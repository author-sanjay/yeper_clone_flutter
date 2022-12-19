// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yeper_user/Screens/LoginScreen/Components/Body.dart';
import 'package:yeper_user/modals/GetOrders.dart';

import '../api.dart';

class GetOrdersapi {
  static Future<List<GetOrders>> getOrders() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http
        .get(Uri.parse(api + "/orders/getsingle/" + user.id.toString()),headers: headers);

    print(res.body);

    List _temp = [];
    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }

    return GetOrders.dealsfromapi(_temp);
  }
}
