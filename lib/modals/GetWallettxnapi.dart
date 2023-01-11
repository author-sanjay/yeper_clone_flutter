// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, file_names, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yeper_user/modals/GetWallettxn.dart';

import '../Screens/Register/Detailsfields.dart';
import '../api.dart';

class Gettxnapi {
  static Future<List<Gettxn>> getDeals() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.get(
        Uri.parse(api + "/txn/getsingle/" + user.id.toString()),
        headers: headers);

    List _temp = [];
    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }

    return Gettxn.dealsfromapi(_temp);
  }
}
