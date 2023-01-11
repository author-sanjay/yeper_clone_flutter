// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, file_names

import 'dart:convert';

import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/modals/GeRefralls.dart';
import 'package:http/http.dart' as http;

import '../api.dart';

class GetRefapi {
  static Future<List<GetRef>> getDeals() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res =
        await http.get(Uri.parse(api + "/refer/ofuser/" + user.id.toString()));
    List _temp = [];
    var result = jsonDecode(res.body);
    for (var i in result) {
      _temp.add(i);
      // print(i);
    }

    return GetRef.dealsfromapi(_temp);
  }
}
