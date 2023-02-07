// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, use_build_context_synchronously, must_be_immutable, prefer_interpolation_to_compose_strings, avoid_print, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace, unnecessary_null_comparison, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:intl/intl.dart';
import 'package:yeper_user/Screens/LoginScreen/Components/PasswordLogin.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import '../../../api.dart';

class OrderBody extends StatefulWidget {
  OrderBody(
      {super.key,
      required this.orderid,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.link,
      required this.platform,
      required this.id,
      required this.status,
      required this.name});
  String name;
  int orderid;
  int id;
  int actualprice;
  String card;
  int earning;
  int offer;
  String desc;
  String photo;
  String link;
  String platform;
  String status;
  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  // bool isloading = true;

  bool neworder = false;
  Future<void> _launchURLBrowser() async {
    var url = Uri.parse("https://www.geeksforgeeks.org/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> urll() async {
    String url = widget.link;
    var urllaunchable = await canLaunchUrl(Uri.parse(url));
    if (urllaunchable) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

      //launch is from url_launcher package to launch URL
    } else {
      print("URL can't be launched.");
    }
  }

  Future<void> update(int id, String txnid) async {
    var dt = DateTime.now();

    var newFormat = DateFormat("dd-MM-yy");
    String updatedDt = newFormat.format(dt);
    final json = jsonEncode({
      "order_status": "Placed",
      "platformtxnid": txnid,
      "product": widget.name,
      "date": updatedDt,
      "deal": widget.id,
    });
    print(json);
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + PasswordLogin.token,
    };
    var res = await http.post(
        Uri.parse(api +
            "/orders/add/" +
            user.id.toString() +
            "/" +
            widget.id.toString()),
        headers: headers,
        body: json);

    try {
      final results = jsonDecode(res.body);
      print(results);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (_) {
      print("Error");
    }
  }

  String? orderidofplatform;
  @override
  void initState() {
    // getdeals(widget.orderid);
    super.initState();
  }

  deals() async {
    await launchUrl(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
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
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 7, 66, 88),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          Container(
            child: Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
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
                top: MediaQuery.of(context).size.height * 0.20,
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
                          widget.orderid == 0
                              ? TextSpan(
                                  text: "Not Placed",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                )
                              : TextSpan(
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
                top: MediaQuery.of(context).size.height * 0.20,
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
                top: MediaQuery.of(context).size.height * 0.10,
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
                top: MediaQuery.of(context).size.height * 0.45,
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
                                      fontSize: 25,
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
                      neworder
                          ? Text(
                              "Click on CLick it to ",
                              style: TextStyle(fontSize: 15),
                            )
                          : Container(
                              color: Colors.white,
                              child: TextFormField(
                                  onChanged: (value) {
                                    orderidofplatform = value;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Platform Order ID")),
                            ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      neworder
                          ? Text("activate offer")
                          : GestureDetector(
                              child: Text("Don't Have one? click here"),
                              onTap: () {
                                urll();
                              },
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Order Summary",
                        style: TextStyle(fontSize: 20),
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
                                      fontSize: 20,
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
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "You Get",
                                  style: TextStyle(
                                      fontSize: 20,
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
                                            fontSize: 25,
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
                                      fontSize: 20,
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
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Profit",
                                  style: TextStyle(
                                      fontSize: 20,
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
                                            fontSize: 25,
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            neworder
                                ? Link(
                                    uri: Uri.parse(widget.link),
                                    builder: ((context, followLink) =>
                                        ElevatedButton(
                                            onPressed: followLink,
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Color.fromARGB(255, 7, 66, 88),
                                              ),
                                            ),
                                            child: Text(
                                              "Place Order",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w300),
                                            ))))
                                : ElevatedButton(
                                    onPressed: () {
                                      if (orderidofplatform == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "Please enter Platform order id"),
                                        ));
                                      } else {
                                        update(widget.orderid,
                                            orderidofplatform.toString());
                                        setState(() {
                                          widget.status = "Placed";
                                        });
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Color.fromARGB(255, 7, 66, 88),
                                      ),
                                    ),
                                    child: Text(
                                      "Place Order",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300),
                                    ))
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
