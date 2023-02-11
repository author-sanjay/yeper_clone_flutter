// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unnecessary_import, must_be_immutable, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/LoginScreen/Components/PasswordLogin.dart';
import 'package:yeper_user/api.dart';
import 'package:yeper_user/constants.dart';
import 'package:http/http.dart' as http;

class PreviewBody extends StatefulWidget {
  PreviewBody(
      {super.key,
      required this.orderid,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.platform,
      required this.id,
      required this.status,
      required this.txn,
      required this.dropdownvalue});
  String txn;
  int orderid;
  int id;
  int actualprice;
  String card;
  int earning;
  int offer;
  String desc;
  String photo;
  String? dropdownvalue;
  String platform;
  String status;
  @override
  State<PreviewBody> createState() => _PreviewBodyState();
}

class _PreviewBodyState extends State<PreviewBody> {
  // bool isloading = true;

  @override
  void initState() {
    // getdeals(widget.orderid);
    super.initState();
  }

  Future<void> otp(int id, String status, String courier, String otp) async {
    if (otp == "") {
      final json = jsonEncode({"status": status, "courier": courier, "id": id});
      print(json);
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + PasswordLogin.token,
      };
      var res = await http.post(Uri.parse(api + "/orders/addotp"),
          headers: headers, body: json);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      final json = jsonEncode({
        "status": status,
        "courier": courier,
        "otp": int.parse(otp),
        "id": id
      });
      print(json);
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer " + PasswordLogin.token,
      };
      var res = await http.post(Uri.parse(api + "/orders/addotp"),
          headers: headers, body: json);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  String otpcode = "";
  String courier = "Others";
  var items = ['Placed', 'Cancelled', 'Out For Delivery', 'Completed'];
  var co = ['E-Kart', 'Delhivery', 'Bluedart', 'Fedex', 'IndiaPost', 'Others'];
  @override
  Widget build(BuildContext context) {
    // widget.dropdownvalue = "Placed";

    return Center(
      child: Stack(
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
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
          ),
          Container(
            // color: Color.fromARGB(255, 95, 15, 148),
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 7, 66, 88),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          Container(
            child: Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
              left: MediaQuery.of(context).size.width * 0.30,
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.25,
              child: ClipRRect(
                  child: Image.network(
                    widget.photo,
                  ),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
            child: Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.05,
                child: Column(
                  children: [
                    Text(
                      "Order\nId",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.orderid.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            child: Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.77,
                child: Column(
                  children: [
                    Text(
                      "Your\nProfit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.earning.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            child: Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.20,
                child: Column(
                  children: [
                    Text(
                      "Order Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
          ),
          Container(
            child: Positioned(
                top: MediaQuery.of(context).size.height * 0.40,
                left: MediaQuery.of(context).size.width * 0.05,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.platform,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 30,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: widget.status == "Placed"
                                    ? Colors.green
                                    : Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                Text(
                                  "Status: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.status,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                          color: Colors.white,
                          child: Text(
                            widget.txn.toUpperCase(),
                            style: TextStyle(fontSize: 25),
                          )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      GestureDetector(
                        child: Text("Don't Have one? click here"),
                        onTap: () {
                          // deals();
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Order Summary",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "You Pay",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.actualprice.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "You Get",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.offer.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              children: [
                                Text(
                                  "Card",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.card.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Profit",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.earning.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        child: Row(
                          children: [
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 15, left: 0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Status",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
                                      child: DropdownButton(
                                        // Initial Value
                                        value: widget.dropdownvalue,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          print(newValue.toString());
                                          widget.dropdownvalue =
                                              newValue.toString();
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 15, left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Courier",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      margin: EdgeInsets.only(left: 10),
                                      child: DropdownButton(
                                        // Initial Value
                                        value: courier,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: co.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          print(newValue.toString());
                                          courier = newValue.toString();
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.02),
                      Container(
                        child: TextField(
                          onChanged: (value) {
                            // DetailsFields.email = value;
                            otpcode = value;
                            setState(() {});
                          },
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(labelText: "Delivery OTP"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          otp(widget.id, widget.dropdownvalue.toString(),
                              courier, otpcode);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 35),
                          decoration: BoxDecoration(
                              color: kprimarycolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Text(
                            "Save",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
