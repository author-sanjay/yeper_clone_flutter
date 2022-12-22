// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/cupertino.dart';

class Users extends ChangeNotifier {
  late final String id;
  late final String name;
  late final String email;
  late final String phonenumber;
  late final String address;
  late final String referalcode;
  late final String referedby;
  late final String acnumber;
  late final String bankname;
  late final int wallet;
  late final String idfc;

  // void signin(String email, String password, int id) {
  //   email = email;
  //   password = password;
  //   id = id;
  // }

  void signin(
      String id,
      String name,
      String email,
      String phonenumber,
      String address,
      String referalcode,
      String referedby,
      String acnumber,
      String bankname,
      int wallet,
      String idfc) {
    id = id;
    name = name;
    email = email;
    phonenumber = phonenumber;
    address = address;
    referalcode = referalcode;
    referedby = referedby;
    acnumber = acnumber;
    bankname = bankname;
    wallet = wallet;
    idfc = idfc;
  }

  // Users.fromJson(Map<dynamic, dynamic> result)
  //     : acnumber = result["acnumber"],
  //       address = result["address"],
  //       wallet = int.parse(result["wallet"]),
  //       bankname = result["bankname"],
  //       email = result["email"],
  //       id = result["uid"],
  //       idfc = result["idfc"],
  //       name = result["name"],
  //       phonenumber = result["phonenumber"],
  //       referalcode = result["referalCode"],
  //       referedby = "referedby";

  // static Users dealsfromapi(api) {
  //   return api.map((e) {
  //     return Users.fromJson(e);
  //   }).toList();
  // }
}
