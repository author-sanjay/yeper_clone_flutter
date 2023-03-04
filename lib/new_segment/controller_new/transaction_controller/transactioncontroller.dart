import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../new_models/transaction_model_list/transactions_list_model.dart';
import 'package:http/http.dart' as http;

import '../../utils/const_url.dart';

class TransactionController extends GetxController {
  final _url = Uri.parse(ConstUrl.baseUrl +
      ConstUrl.transaction +
      (FirebaseAuth.instance.currentUser?.uid).toString());

  Future<List<Transactionslist>> getDeals() async {
    final prefs = await SharedPreferences.getInstance();

    final _token = prefs.getString("token");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + _token!,
    };
    var res = await http.get(_url, headers: headers);

    List _temp = [];
    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }

    return Transactionslist.dealsfromapi(_temp);
  }

  Future<int> getbalance() async {
    final _url = Uri.parse(ConstUrl.baseUrl +
        ConstUrl.walet +
        (FirebaseAuth.instance.currentUser?.uid).toString());
    final prefs = await SharedPreferences.getInstance();

    final _token = prefs.getString("token");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + _token!,
    };
    var res = await http.get(_url, headers: headers);

    var result = jsonDecode(res.body);

    return result;
  }
}
