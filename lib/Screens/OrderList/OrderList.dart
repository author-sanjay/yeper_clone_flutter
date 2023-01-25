// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, must_be_immutable, avoid_print, camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/HeaderWithSearchbar.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/OrderList/Orderpreview.dart';
import 'package:yeper_user/modals/GetOrders.dart';
import 'package:yeper_user/modals/GetOrdersapi.dart';

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
            orderlistbody(isloading: _isloading, getdeals: _getdeals),
        bottomNavigationBar: bottomnavbar());
  }
}

class orderlistbody extends StatelessWidget {
  const orderlistbody({
    Key? key,
    required bool isloading,
    required List<GetOrders> getdeals,
  })  : _isloading = isloading,
        _getdeals = getdeals,
        super(key: key);

  final bool _isloading;
  final List<GetOrders> _getdeals;

  @override
  Widget build(BuildContext context) {
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
                                date: _getdeals[index].date,
                                name: _getdeals[index].product,
                                orderid: _getdeals[index].orderid.toString(),
                                platforid: _getdeals[index].txn,
                                status: _getdeals[index].orderstatus,
                                deal: _getdeals[index].deal);
                          },
                          shrinkWrap: true,
                          itemCount: _getdeals.length,
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

class list extends StatelessWidget {
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
  Widget build(BuildContext context) {
    var newname = name.split(" ");
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderPreview(
                orderid: int.parse(orderid),
                id: deal,
                status: status,
                txn: platforid),
          ),
        )
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
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
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    color: kprimarycolor,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "l",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w100),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Row(children: [
                      Container(
                        child: Column(children: [
                          Text(
                            newname[0],
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            "Order id: $orderid",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ]),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Column(children: [
                          status == "Placed"
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 130, 234, 40),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                      "$status",
                                      style: TextStyle(fontSize: 15),
                                    )),
                                  ))
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 234, 82, 40),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                      "$status",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                                  )),
                          SizedBox(
                            height: 10,
                          ),
                          Text("$date",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          // Text("Platformid: $platforid")
                        ]),
                      )
                    ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
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
