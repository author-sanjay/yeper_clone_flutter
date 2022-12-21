// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/OrderConfirmation/Components/OrderBody.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: OrderBody(
        url: "https://flutter.dev",
      )),
    );
  }
}
