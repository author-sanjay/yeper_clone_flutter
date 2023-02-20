import 'package:flutter/material.dart';

class ReusableLaodingIndicator extends StatelessWidget {
  final String text;

  const ReusableLaodingIndicator({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text),
          SizedBox(
            height: 16,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
