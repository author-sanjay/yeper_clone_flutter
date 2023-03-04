// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, must_be_immutable, unused_local_variable, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:yeper_user/Screens/LoginScreen/OrderConfirmation/OrderConfirmation.dart';
import 'package:yeper_user/constants.dart';

class Body extends StatefulWidget {
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
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var newname = widget.name.split(" ");
    String shortname = newname[0];

    Size size = MediaQuery.of(context).size;
    var produtname = newname;

    Future<void> urll() async {
      String url = widget.link;
      var urllaunchable = await canLaunchUrl(Uri.parse(url));
      if (urllaunchable) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
            .then((value) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderConfirmation(
                        orderid: 0,
                        actualprice: widget.actualprice,
                        card: widget.card,
                        earning: widget.earning,
                        offer: widget.offer,
                        desc: widget.desc,
                        photo: widget.photo,
                        link: widget.link,
                        platform: widget.platform,
                        id: widget.id,
                        status: "UnPlaced",
                        name: widget.name),
                  ),
                )); //launch is from url_launcher package to launch URL
      } else {
        print("URL can't be launched.");
      }
    }

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              headerwithname(
                name: widget.name,
              ),
              SizedBox(
                height: 5,
              ),
              imageofproduct(photos: widget.photo),
              SizedBox(
                height: 30,
              ),
              titileanddesc(
                shortname: shortname,
                photo: widget.photo,
                desc: widget.desc,
                platform: widget.platform,
              ),
              SizedBox(
                height: 10,
              ),
              pricedetails(
                  actualprice: widget.actualprice,
                  offer: widget.offer,
                  earning: widget.earning),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kprimarycolor),
                  ),
                  onPressed: () {
                    urll();
                  },
                  child: Center(
                    child: Container(
                      color: kprimarycolor,
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                          child: Text(
                        "Order Now",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
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
                          width: 4,
                          color: kprimarycolor,
                          child: Text(
                            "j",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w100),
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
                    style: TextStyle(fontSize: 12),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "₹ $actualprice",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                          width: 4,
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
                    style: TextStyle(fontSize: 12),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "₹ $offer",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
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
                          width: 4,
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
                    style: TextStyle(fontSize: 12),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "₹ $earning",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
  const titileanddesc(
      {Key? key,
      required this.shortname,
      required this.photo,
      required this.desc,
      required this.platform})
      : super(key: key);
  final String platform;
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
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                shortname.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                platform,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
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
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        desc,
                        style: TextStyle(fontSize: 15),
                      ),
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
