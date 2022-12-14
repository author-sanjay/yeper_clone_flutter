import 'package:flutter/material.dart';

import '../../constants.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: // ignore_for_file: prefer_const_constructors, sort_child_properties_last
            SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: kprimarycolor,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              //Container for top data
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (() {
                        print("Hello");
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
                        child: Column(
                          children: <Widget>[
                           
                            Text(
                              "Your Orders",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 50),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),

              //draggable sheet
              DraggableScrollableSheet(
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(243, 245, 248, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Recent Transactions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 24,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 32),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 32),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18))),
                                      child: Icon(
                                        Icons.date_range,
                                        color: Colors.lightBlue[900],
                                      ),
                                      padding: EdgeInsets.all(12),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Payment",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey[900]),
                                          ),
                                          Text(
                                            "Payment from Saad",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey[500]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        
                                        Text(
                                          "26 Jan",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[500]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            shrinkWrap: true,
                            itemCount: 10,
                            padding: EdgeInsets.all(0),
                            controller:
                                ScrollController(keepScrollOffset: false),
                          ),
                        ],
                      ),
                      controller: scrollController,
                    ),
                  );
                },
                initialChildSize: 0.65,
                minChildSize: 0.65,
                maxChildSize: 1,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
