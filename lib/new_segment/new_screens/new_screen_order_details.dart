import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../reusable_widget/reusable_underline_textfield.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;
  TextEditingController _otpController = TextEditingController();
  TextEditingController _addressController = TextEditingController(
    text: "191, PNTC, Ahemdabad, India",
  );
  TextEditingController _mobileNoController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    _addressController.dispose();
    _mobileNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: Color(0xff1C2039),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 2.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/images/back.png",
                                          scale: 5,
                                        ),
                                        Text(
                                          " Order Details",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Image.asset(
                                          "assets/images/back.png",
                                          color: Colors.transparent,
                                          scale: 5,
                                        ),
                                      ]),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        " Order Id\n7",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Spacer(
                                        flex: 8,
                                      ),
                                      Text(
                                        " Your Profit\n3000",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Amazon",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "Status:Placed",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "556777777",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't Have One? Check here",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Order Summary",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "You Pay",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            "12000",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "You Get",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            "15000",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Card",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        Text(
                                          "SBI SUPER CARD",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Profit",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          "3000",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Counter",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              hint: Text(
                                                'Placed',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ),
                                              items: items
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              value: selectedValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedValue =
                                                      value as String;
                                                });
                                              },
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down),
                                              buttonHeight: 40,
                                              buttonWidth: 140,
                                              itemHeight: 40,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Divider(
                                                color: Colors.black,
                                                thickness: 1,
                                              )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              hint: Text(
                                                'Other',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ),
                                              items: items
                                                  .map((item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              value: selectedValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedValue =
                                                      value as String;
                                                });
                                              },
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down),
                                              buttonHeight: 40,
                                              buttonWidth: 140,
                                              itemHeight: 40,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Divider(
                                                color: Colors.black,
                                                thickness: 1,
                                              )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                          ReusableUnderlineTextfield(
                            title: "Delivery Address",
                            controller: _addressController,
                            isReadOnly: true,
                          ),
                          ReusableUnderlineTextfield(
                              title: "Mobile Number",
                              controller: _mobileNoController),
                          ReusableUnderlineTextfield(
                              title: "Delivery Otp",
                              controller: _otpController),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xff1C2039),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                        ],
                      ),
                      Positioned(
                        top: 10.h,
                        left: 32.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/7/7e/Virat_Kohli.jpg",
                            width: 30.w,
                            height: 18.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
