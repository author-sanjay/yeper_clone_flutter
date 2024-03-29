// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import '../../../modals/GetDeals.dart';
import '../../../modals/GetDealsapi.dart';
import 'HeaderWithSearchbar.dart';
import 'ItemCard.dart';
import 'TitleWithButton.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<GetDeals> _getdeals;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await Getdealsapi.getDeals();
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
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              HeaderWithSearchbar(size: size),
              TitleWithButton(),
              _isloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : _getdeals.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Center(
                            child: Flexible(
                                child: Text(
                              "No Active Deals Please Check after Some time",
                              style: TextStyle(fontSize: 20),
                            )),
                          ),
                        )
                      : Wrap(
                          children: [
                            for (var i in _getdeals)
                              ItemCard(
                                id: i.id,
                                cardname: i.card,
                                itemname: i.name,
                                profit: i.earning.toDouble(),
                                site: i.platform,
                                image: i.images,
                                link: i.offerlink,
                                platform: i.platform,
                                press: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => DetailsScreen(),
                                  //   ),
                                  // );
                                },
                                actual: i.actual,
                                desc: i.desc,
                                offer: i.offer,
                              ),
                          ],
                        )
            ],
          ),
        ),
      ),
    );
  }
}
