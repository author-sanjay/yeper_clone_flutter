// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/HeaderWithSearchbar.dart';
import 'package:yeper_user/Screens/Referal/Referal.dart';
import 'package:yeper_user/modals/GeRefralls.dart';

import '../../constants.dart';
import '../../modals/GetReferals.dart';

class ReferralList extends StatefulWidget {
  const ReferralList({super.key});

  @override
  State<ReferralList> createState() => _ReferralListState();
}

class _ReferralListState extends State<ReferralList> {
  late List<GetRef> _getdeals;
  bool _isloading = true;
  Future<void> getDeals() async {
    _getdeals = await GetRefapi.getDeals();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(isloading: _isloading, getdeals: _getdeals),
      bottomNavigationBar: GestureDetector(
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Referral()),
          );
        }),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: kprimarycolor,
          child: Text(
            "Refer More",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}

class body extends StatelessWidget {
  const body({
    Key? key,
    required bool isloading,
    required List<GetRef> getdeals,
  })  : _isloading = isloading,
        _getdeals = getdeals,
        super(key: key);

  final bool _isloading;
  final List<GetRef> _getdeals;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            HeaderWithSearchbar(size: MediaQuery.of(context).size),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Your Referals",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: _isloading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return list(
                                  date: _getdeals[index].date,
                                  name: _getdeals[index].name);
                            },
                            shrinkWrap: true,
                            itemCount: _getdeals.length,
                            padding: EdgeInsets.all(0),
                            controller:
                                ScrollController(keepScrollOffset: false),
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class list extends StatelessWidget {
  list({Key? key, required this.date, required this.name}) : super(key: key);
  String name;
  String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 32),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: Icon(
              Icons.person,
              color: Colors.lightBlue[900],
            ),
            // padding: EdgeInsets.all(12),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text(
                  date,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ref extends StatefulWidget {
  ref({Key? key, required this.name, required this.date}) : super(key: key);
  String name;
  String date;
  @override
  State<ref> createState() => _refState();
}

class _refState extends State<ref> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: Icon(
              Icons.person,
              color: Colors.lightBlue[900],
            ),
            padding: EdgeInsets.all(12),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[900]),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                widget.date,
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
  }
}
