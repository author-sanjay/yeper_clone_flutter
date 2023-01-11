// ignore_for_file: file_names, avoid_web_libraries_in_flutter


import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.id,
    required this.name,
    required this.photo,
  }) : super(key: key);
  final String name;
  final String photo;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("$name\n",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600)),
              const Text(
                "XXXX XXXX XXXX",
                style: TextStyle(fontSize: 20),
              ),
            ]),
      ),
    );
  }
}
