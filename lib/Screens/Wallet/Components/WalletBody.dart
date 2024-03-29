// ignore_for_file: prefer_const_constructors, sort_child_properties_last, file_names, unused_import, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable, camel_case_types, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/DetailsScreen/Components/Body.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/HeaderWithSearchbar.dart';
import 'package:yeper_user/Screens/LoginScreen/Components/PasswordLogin.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/Screens/Wallet/Components/Header.dart';
import 'package:yeper_user/constants.dart';
import 'package:yeper_user/modals/GetWallettxn.dart';
import 'package:yeper_user/modals/GetWallettxnapi.dart';
import 'package:http/http.dart' as http;
import '../../../api.dart';
import '../../ProfilePage/Profile.dart';

class WalletBody extends StatefulWidget {
  const WalletBody({super.key});

  @override
  State<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  Future<void> getbalance() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + PasswordLogin.token,
    };
    var res = await http.get(
        Uri.parse(api + "/user/getwalletbalance/" + user.id.toString()),
        headers: headers);

    var result = jsonDecode(res.body);
    balance = result;
    print(balance);
    setState(() {});
  }

  late int balance;
  late List<Gettxn> _getdeals;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getDeals();
    getbalance();
  }

  Future<void> getDeals() async {
    _getdeals = await Gettxnapi.getDeals();
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
                      onTap: (() {}),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: size.height * 0.05),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(user.photo.toString()),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Hi,  ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  user.name.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Your Balance",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                            ),
                            _isloading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    "Rs $balance",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 30),
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
                          _isloading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  itemBuilder: (context, index) {
                                    return txndetails(
                                        amount: _getdeals[index].amount,
                                        incoming: _getdeals[index].incoming,
                                        date: _getdeals[index].date);
                                  },
                                  shrinkWrap: true,
                                  itemCount: _getdeals.length,
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
    );
  }
}

class txndetails extends StatelessWidget {
  txndetails({
    Key? key,
    required this.amount,
    required this.date,
    required this.incoming,
  }) : super(key: key);
  int amount;
  String date;
  bool incoming;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 32),
      height: MediaQuery.of(context).size.height * 0.12,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Payment",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[900]),
                ),
                incoming
                    ? Flexible(
                        child: Text(
                          "Payment from CCredit",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500]),
                        ),
                      )
                    : Text(
                        "Paid to you",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[500]),
                      ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              incoming
                  ? Text(
                      "+ Rs $amount",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.lightGreen),
                    )
                  : Text(
                      "-Rs $amount",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
              // Text(
              //   "$date",
              //   style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.w700,
              //       color: Colors.grey[500]),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
