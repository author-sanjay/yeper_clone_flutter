// ignore_for_file: file_names


import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  final int id;
  final String name;
  final String email;
  final String phonenumber;
  final String address;
  final String referalcode;
  final String referedby;
  final int acnumber;
  final String bankname;
  final int wallet;
  final String idfc;
  User(
      this.acnumber,
      this.address,
      this.wallet,
      this.bankname,
      this.email,
      this.id,
      this.idfc,
      this.name,
      this.phonenumber,
      this.referalcode,
      this.referedby);

  void signin(String email, String password, int id) {
    email = email;
    password = password;
    id = id;
  }
}
