// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yeper_user/Screens/ChooseCard/Components/Header.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/HeaderWithSearchbar.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/modals/GetCards.dart';
import 'package:yeper_user/modals/GetCardsapi.dart';
import 'package:http/http.dart' as http;
import '../../../api.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<GetCard> _getdeals;
  // String name = "";
  // List _temp = [];
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await GetCardsapi.getuser(user.id.toString());
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
    // print(_temp.length);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SafeArea(
            child: _isloading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      HeaderWithSearchbar(size: size),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Your Cards",
                                  style: TextStyle(fontSize: 20),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: _getdeals.length == 0
                                  ? Column(
                                      children: const [
                                        Text(
                                          "No Card Selected",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        for (var i in _getdeals)
                                          Card(name: i.name, photo: i.photo)
                                      ],
                                    ),
                            )
                          ],
                        ),
                      )
                    ],
                  )));
  }
}

class old extends StatelessWidget {
  const old({
    Key? key,
    required this.size,
    required List temp,
    required List<GetCard> getdeals,
  })  : _temp = temp,
        _getdeals = getdeals,
        super(key: key);

  final Size size;
  final List _temp;
  final List<GetCard> _getdeals;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderWithSearchbar(size: size),
        Container(
          child: _temp.length == 0
              ? Column(
                  children: [
                    Text(
                      "No Card Selected",
                      style: TextStyle(fontSize: 20),
                    ),
                    for (var i in _temp) Card(name: i.name, photo: i.photo)
                  ],
                )
              : Column(
                  children: [
                    Text("Selected Cards"),
                    for (var i in _temp) Card(name: i.name, photo: i.photo)
                  ],
                ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "All Cards",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        for (var i in _getdeals)
          Card(
            // id: i.id,
            photo: i.photo,
            name: i.name,
            // profit: i.earning.toDouble(),
            // site: i.platform,
            // image: i.images,
            // link: i.offerlink,
            // platform: i.platform,
            // press: () {
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(
            //   //     builder: (context) => DetailsScreen(),
            //   //   ),
            //   // );
            // },
            // actual: i.actual,
            // desc: i.desc,
            // offer: i.offer,
          ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    // required this.id,
    required this.name,
    required this.photo,
  }) : super(key: key);
  final String name;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15.0, bottom: 10),
            child: Container(alignment: Alignment.topLeft,child: Text(name, style: TextStyle(fontSize: 20),)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300),
            child: Padding(
                padding: const EdgeInsets.only(left: 0, top: 0),
                child: Image.network(
                  photo,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
