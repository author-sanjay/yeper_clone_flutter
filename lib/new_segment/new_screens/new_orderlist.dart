import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 10.h,
              decoration: BoxDecoration(
                  color: Color(0xff1C2039),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                ),
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Hi Spookie weirdo",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(
                "Order Page ",
                style: TextStyle(
                    color: Color(0xff212223),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "https://images.pexels.com/photos/7742555/pexels-photo-7742555.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Apple\nRefurbished iPhone\nXR \128GB (Any Colour)",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              height: 1.25),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Accepted on 09 Mar 2022",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "Amazon Pay Card",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "You Spent",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(.7),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "₹ 50,000",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "You Spent",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(.7),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "₹ 50,000",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "You Spent",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(.7),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "₹ 50,000",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4.w,
                                                  vertical: 0.8.h),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff1C2039),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Center(
                                                  child: Text(
                                                "Enter Order Id",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "not order yet ?",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "Order Now",
                                                  style: TextStyle(
                                                      color: Color(0xff1C2039),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 1,
                            right: 5,
                            child: CircleAvatar(
                              backgroundColor: Color(0xff1C2039),
                              radius: 10,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "https://images.pexels.com/photos/7742555/pexels-photo-7742555.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Apple\nRefurbished iPhone\nXR \128GB (Any Colour)",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              height: 1.25),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Accepted on 09 Mar 2022",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "Amazon Pay Card",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "You Spent",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(.7),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "₹ 50,000",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "You Spent",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(.7),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "₹ 50,000",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "You Spent",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(.7),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "₹ 50,000",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Your Payment will Be released by 2022-04-21 11;59 pm For any Query please contact to our playment support team",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 1,
                            right: 5,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffA6A6A6),
                              radius: 10,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
