// // ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print, prefer_interpolation_to_compose_strings, file_names

// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import 'package:yeper_user/modals/GetOrders.dart';
// import 'package:yeper_user/modals/UserModal.dart';

// import '../Screens/Register/Detailsfields.dart';
// import '../api.dart';

// class UserModelapi {
//   static Future<User> getOrders() async {
//     Map<String, String> headers = {"Content-type": "application/json"};
//     var res =
//         await http.get(Uri.parse(api + "/orders/getsingle/"), headers: headers);

//     print(res.body);

//     return User.dealsfromapi(res);
//   }
// }
