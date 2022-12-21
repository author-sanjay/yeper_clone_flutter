// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderBody extends StatefulWidget {
  OrderBody(
      {super.key,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.link,
      required this.platform});

  int actualprice;
  String card;
  int earning;
  int offer;
  String desc;
  String photo;
  String link;
  String platform;

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
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
                  child: Image.network(widget.photo),
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
                    Text(
                      "hghu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
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
                    Text(
                      "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            child: Positioned(
                top: MediaQuery.of(context).size.height * 0.10,
                left: MediaQuery.of(context).size.width * 0.30,
                child: Column(
                  children: [
                    Text(
                      "Iphone",
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
                          Text(
                            "Flipkart",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Container(
                            height: 30,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
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
                                Text(
                                  "Placed",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
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
                        child: TextField(
                            decoration: InputDecoration(
                                labelText: "Flipkart order ID")),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text("Don't Have one? click here"),
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
                                Text(
                                  "20000",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                                Spacer(),
                                Text(
                                  "You Get",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  "20500",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                )
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
                                Text(
                                  "Visa",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                                Spacer(),
                                Text(
                                  "Profit",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  "20500",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                )
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
                            ElevatedButton(
                                onPressed: () {
                                  deals();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 7, 66, 88),
                                  ),
                                ),
                                child: Text(
                                  "Claim It",
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
