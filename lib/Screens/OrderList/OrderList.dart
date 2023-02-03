// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, must_be_immutable, avoid_print, camel_case_types, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/HeaderWithSearchbar.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/LoginScreen/Components/PasswordLogin.dart';
import 'package:yeper_user/Screens/OrderList/Orderpreview.dart';
import 'package:yeper_user/api.dart';
import 'package:yeper_user/modals/GetOrders.dart';
import 'package:yeper_user/modals/GetOrdersapi.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  late List<GetOrders> _getdeals;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await GetOrdersapi.getOrders();
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: // ignore_for_file: prefer_const_constructors, sort_child_properties_last
            _isloading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : orderlistbody(getdeals: _getdeals),
        bottomNavigationBar: bottomnavbar());
  }
}

class orderlistbody extends StatefulWidget {
  orderlistbody({
    Key? key,
    // required bool isloading,
    required List<GetOrders> getdeals,
  })  : _getdeals = getdeals,
        super(key: key);

  final List<GetOrders> _getdeals;

  @override
  State<orderlistbody> createState() => _orderlistbodyState();
}

class _orderlistbodyState extends State<orderlistbody> {
  bool _isloading = true;

  @override
  Widget build(BuildContext context) {
    if (widget._getdeals.isNotEmpty) {
      setState(() {
        _isloading = false;
      });
    }
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        child: Column(
          children: [
            HeaderWithSearchbar(size: MediaQuery.of(context).size),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Your Orders',
                        style: TextStyle(fontSize: 30),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  _isloading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return list(
                                date: widget._getdeals[index].date,
                                name: widget._getdeals[index].product,
                                orderid:
                                    widget._getdeals[index].orderid.toString(),
                                platforid: widget._getdeals[index].txn,
                                status: widget._getdeals[index].orderstatus,
                                deal: widget._getdeals[index].deal);
                          },
                          shrinkWrap: true,
                          itemCount: widget._getdeals.length,
                          padding: EdgeInsets.all(0),
                          controller: ScrollController(keepScrollOffset: false),
                        ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class list extends StatefulWidget {
  list(
      {Key? key,
      required this.date,
      required this.name,
      required this.orderid,
      required this.platforid,
      required this.status,
      required this.deal})
      : super(key: key);
  int deal;
  String name;
  String orderid;
  String status;
  String platforid;
  String date;

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  bool loading = true;
  late String photo;
  late String name;
  late String spent;
  late String earn;
  late String uget;

  Future<void> getdeal() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + PasswordLogin.token,
    };
    var res = await http.get(
        Uri.parse(api + '/deals/getsingle/' + widget.deal.toString()),
        headers: headers);
    var result = jsonDecode(res.body);
    photo = result["photourl"].toString();
    name = result["product_name"].toString();
    spent = result["actual_price"].toString();
    uget = result["offer_price"].toString();
    earn = result["user_earning"].toString();
    setState(() {
      loading = false;
    });
    print(name);
  }

  @override
  void initState() {
    super.initState();
    getdeal();
  }

  @override
  Widget build(BuildContext context) {
    var newname = widget.name.split(" ");
    return loading
        ? Center(child: CircularProgressIndicator())
        : GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPreview(
                      orderid: int.parse(widget.orderid),
                      id: widget.deal,
                      status: widget.status,
                      txn: widget.platforid),
                ),
              )
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        color: kprimarycolor.withOpacity(0.23)),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Image(
                            image: NetworkImage(photo),
                            fit: BoxFit.contain,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.2,
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  name.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  "Accepted on " + widget.date,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Spent"),
                                        Text(
                                          spent,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Recieve"),
                                        Text(
                                          uget,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Earn"),
                                        Text(
                                          earn,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class orderdetails extends StatelessWidget {
  orderdetails(
      {Key? key,
      required this.name,
      required this.date,
      required this.status,
      required this.id,
      required this.deal,
      required this.platformlink})
      : super(key: key);

  String platformlink;
  int id;
  String name;
  String date;
  String status;
  int deal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderPreview(
              status: status,
              orderid: id,
              id: deal,
              txn: platformlink,
            ),
          ),
        );
      }),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        padding: EdgeInsets.only(top: 16),
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
                    "$name",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[900]),
                  ),
                  Text(
                    "$status",
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
                Text(
                  "$date",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
