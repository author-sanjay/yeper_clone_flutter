// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/Wallet/Components/WalletBody.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WalletBody(),
    );
  }
}