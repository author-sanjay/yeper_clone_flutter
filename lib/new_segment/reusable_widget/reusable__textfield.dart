import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ReusbleTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isOtp;
  final bool isPhone;
  final bool isEnterOtp;
  Callback? onTap;

  ReusbleTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPhone = false,
    this.isOtp = false,
    this.isEnterOtp = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [
        isPhone
            ? LengthLimitingTextInputFormatter(10)
            : isEnterOtp ? LengthLimitingTextInputFormatter(6) :LengthLimitingTextInputFormatter(30)
      ],
      keyboardType: isPhone || isEnterOtp ? TextInputType.phone : TextInputType.name,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: isOtp
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                      color: Color(0xff29295D),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Send OTP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC1C1C1), width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC1C1C1), width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC1C1C1), width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC1C1C1), width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Color(0xffC1C1C1), fontSize: 13),
      ),
      validator: ((value) {
        if (value!.isEmpty) return "This Field is Required";
        return null;
      }),
    );
  }
}
