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
  String name = "";
  List _temp = [];
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getuser(String id) async {
    // _getusers=await GetCardsapi.getbyname(Strinf id);
    Map<String, String> headers = {"Content-type": "application/json"};
    var json = jsonEncode({
      // "name"
    });
    var res = await http.get(Uri.parse(api + "/cards/getbyname/" + id));
    print(res.body);

    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }
    print(_temp);
  }

  Future<void> addcard(String id) async {
    // _getusers=await GetCardsapi.getbyname(Strinf id);
    Map<String, String> headers = {"Content-type": "application/json"};

    var res =
        await http.get(Uri.parse(api + "/user/addcards/" + user.id.toString()));
    print(res.body);

    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }
    print(_temp);
  }

  Future<void> getDeals() async {
    _getdeals = await GetCardsapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        children: <Widget>[
          HeaderWithSearchbar(size: size),
          Container(
            child: _temp.length == 0
                ? Column(
                    children: [
                      Text("No Card Selected", style: TextStyle(fontSize: 20),),
                      for (var i in _temp)
                        Card(id: i.id, name: i.name, photo: i.photo)
                    ],
                  )
                : Column(
                    children: [
                      Text("Selected Cards"),
                      for (var i in _temp)
                        Card(id: i.id, name: i.name, photo: i.photo)
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
              id: i.id,
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
      ),
    ));
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.id,
    required this.name,
    required this.photo,
  }) : super(key: key);
  final String name;
  final String photo;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          // Text(name),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.3,
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
