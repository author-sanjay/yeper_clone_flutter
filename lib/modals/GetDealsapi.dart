// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, file_names

import 'dart:convert';

import 'package:yeper_user/Components/PasswordLogin.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/modals/GetDeals.dart';
import 'package:http/http.dart' as http;
import '../api.dart';

class Getdealsapi {
  static Future<List<GetDeals>> getDeals() async {
    String token = user.token.toString();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + PasswordLogin.token,
    };

    var res =
        await http.get(Uri.parse(api + "/deals/getactive"), headers: headers);
    print(res.body);
    print(res.statusCode);
    List _temp = [];
    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }

    return GetDeals.dealsfromapi(_temp);
  }
}
