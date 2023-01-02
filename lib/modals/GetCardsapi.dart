// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, file_names

import 'dart:convert';
import 'package:yeper_user/modals/GetCards.dart';
import 'package:yeper_user/modals/GetDeals.dart';
import 'package:http/http.dart' as http;

import '../api.dart';

class GetCardsapi {
  static Future<List<GetCard>> getDeals() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.get(Uri.parse(api + "/cards/getall"));
    List _temp = [];
    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }

    return GetCard.dealsfromapi(_temp);
  }

  static Future<List<GetCard>> getbyname(String id) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.get(Uri.parse(api + "/cards/getbyname/" + id));
    List _temp = [];
    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }

    return GetCard.dealsfromapi(_temp);
  }
}
