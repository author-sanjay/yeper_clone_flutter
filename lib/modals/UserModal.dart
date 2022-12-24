// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/cupertino.dart';

class Wallet {
  late int id;
  late int balance;
  Wallet(this.balance, this.id);
}

class Users extends ChangeNotifier {
  late String? id;
  late String? name;
  late String? email;
  late String? phonenumber;
  late String? address;
  late String? referalcode;
  late String? referedby;
  late String? acnumber;
  late String? bankname;
  // late Wallet wallet;
  late String? idfc;

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
      // Wallet wallet,
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
    // wallet = wallet;
    idfc = idfc;
    notifyListeners();
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
