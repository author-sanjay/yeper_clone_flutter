// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color.fromARGB(255, 197, 197, 195),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Container(
            
            decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
            ),
          ),
        )
      ],
    );
  }
}
