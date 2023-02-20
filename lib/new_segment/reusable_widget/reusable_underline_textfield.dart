import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReusableUnderlineTextfield extends StatelessWidget {
  final String title;
  final bool isReadOnly;
  final TextEditingController controller;
  ReusableUnderlineTextfield(
      {required this.title, required this.controller, this.isReadOnly = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title}",
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          TextFormField(
            controller: controller,
            readOnly: isReadOnly,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                //               obscureText: true,
                // obscuringCharacter: "*",
                contentPadding: EdgeInsets.only(top: 12),
                isDense: true,
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.2), width: 1)),
                enabledBorder: UnderlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                )),
            validator: ((value) {
              if (value!.isEmpty) return "This Field is Required";
              return null;
            }),
          ),
        ],
      ),
    );
  }
}
