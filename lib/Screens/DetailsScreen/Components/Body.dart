// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, must_be_immutable, unused_local_variable, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/OrderConfirmation/OrderConfirmation.dart';
import 'package:yeper_user/constants.dart';

class Body extends StatelessWidget {
  Body(
      {super.key,
      required this.actualprice,
      required this.card,
      required this.earning,
      required this.offer,
      required this.desc,
      required this.photo,
      required this.link,
      required this.platform,
      required this.id,
      required this.name});
  String name;
  int id;
  int actualprice;
  String card;
  int earning;
  int offer;
  String desc;
  String photo;
  String link;
  String platform;
  static late String produtname;
  @override
  Widget build(BuildContext context) {
    var newname = name.split(" ");
    String shortname = newname[0];

    Size size = MediaQuery.of(context).size;
    produtname = name;
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              headerwithname(
                name: name,
              ),
              SizedBox(
                height: 5,
              ),
              imageofproduct(photos: photo),
              SizedBox(
                height: 30,
              ),
              titileanddesc(shortname: shortname, photo: photo, desc: desc),
              SizedBox(
                height: 10,
              ),
              pricedetails(
                  actualprice: actualprice, offer: offer, earning: earning),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderConfirmation(
                            name: name,
                            orderid: 0,
                            actualprice: actualprice,
                            card: card,
                            earning: earning,
                            offer: offer,
                            desc: desc,
                            photo: photo,
                            link: link,
                            platform: platform,
                            id: id,
                            status: "Unplaced")),
                  );
                }),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(kDefaultPadding),
                  width: MediaQuery.of(context).size.width,
                  color: kprimarycolor,
                  child: Text(
                    "ORDER NOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
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

class pricedetails extends StatelessWidget {
  const pricedetails({
    Key? key,
    required this.actualprice,
    required this.offer,
    required this.earning,
  }) : super(key: key);

  final int actualprice;
  final int offer;
  final int earning;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.all(kDefaultPadding),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 246, 243),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 108, 106, 106),
                      offset: const Offset(
                        -1.0,
                        1.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
              width: MediaQuery.of(context).size.width * 0.28,
              child: Column(
                children: [
                  Container(
                    height: 55,
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          color: kprimarycolor,
                          child: Text(
                            "j",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w200),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Image(image: AssetImage("assets/images/Vector.png"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Text(
                    "You Will Spend",
                    style: TextStyle(fontSize: 15),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rs $actualprice",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 246, 243),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 108, 106, 106),
                      offset: const Offset(
                        -1.0,
                        1.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
              width: MediaQuery.of(context).size.width * 0.28,
              child: Column(
                children: [
                  Container(
                    height: 55,
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          color: kprimarycolor,
                          child: Text(
                            "j",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w200),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Image(image: AssetImage("assets/images/get.png"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Text(
                    "You Will Get",
                    style: TextStyle(fontSize: 15),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rs $offer",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 246, 243),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 108, 106, 106),
                      offset: const Offset(
                        -1.0,
                        1.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
              width: MediaQuery.of(context).size.width * 0.28,
              child: Column(
                children: [
                  Container(
                    height: 55,
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          color: kprimarycolor,
                          child: Text(
                            "j",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w200),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Image(image: AssetImage("assets/images/wall.png"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Text(
                    "Your Earning",
                    style: TextStyle(fontSize: 15),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rs $earning",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class titileanddesc extends StatelessWidget {
  const titileanddesc({
    Key? key,
    required this.shortname,
    required this.photo,
    required this.desc,
  }) : super(key: key);

  final String shortname;
  final String photo;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: Container(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 246, 243),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 108, 106, 106),
                        offset: const Offset(
                          -1.0,
                          1.0,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ]),
                child: Row(
                  children: [
                    Row(children: [
                      Container(
                        alignment: Alignment.topLeft,
                        color: kprimarycolor,
                        child: Text(
                          "l",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          shortname,
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ]),
                    Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, top: 8, bottom: 8),
                      child: Container(
                        child: Image(
                          image: NetworkImage(photo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 246, 243),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 108, 106, 106),
                      offset: const Offset(
                        -1.0,
                        1.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
              // height: MediaQuery.of(context).size.height*0.3,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w500),
                      )),
                  Container(
                    child: Text(
                      desc,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class imageofproduct extends StatelessWidget {
  imageofproduct({Key? key, required this.photos}) : super(key: key);
  String photos;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      // color: Colors.cyan,
      child: Image(image: NetworkImage(photos), fit: BoxFit.cover),
    );
  }
}

class headerwithname extends StatelessWidget {
  headerwithname({Key? key, required this.name}) : super(key: key);
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kprimarycolor,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.navigate_before,
              size: 40,
              color: Colors.white,
            )),
        Spacer(),
        Flexible(
          child: Text(
            "Details",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ),
        Spacer(),
      ]),
    );
  }
}
