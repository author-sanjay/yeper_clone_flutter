// ignore_for_file: file_names, avoid_unnecessary_containers, unused_field

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/ChooseCard/ChooseCard.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/HeaderWithSearchbar.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/modals/GetCards.dart';
import 'package:yeper_user/modals/GetCardsapi.dart';

class AddCards extends StatefulWidget {
  const AddCards({super.key});

  @override
  State<AddCards> createState() => _AddCardsState();
}

class _AddCardsState extends State<AddCards> {
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
    _getdeals = await GetCardsapi.getDeals();
    setState(() {
      _isloading = false;
    });
    // print(_temp.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: SafeArea(
                    child: Container(
                  child: Column(
                    children: [
                      HeaderWithSearchbar(size: MediaQuery.of(context).size),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  "Click on Cards to \nadd to your Profile",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            for (var i in _getdeals)
                              Card(id: i.id, name: i.name, photo: i.photo)
                          ],
                        ),
                      )
                    ],
                  ),
                )),
              ),
        bottomNavigationBar: bottomnavbar());
  }
}

class Card extends StatefulWidget {
  const Card({
    Key? key,
    required this.id,
    required this.name,
    required this.photo,
  }) : super(key: key);
  final int id;
  final String name;
  final String photo;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  late List<GetCard> _getdeals;
  Future<void> addcard(int id) async {
    _getdeals = await GetCardsapi.addcard(id);

    // print(_temp.length);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addcard(widget.id);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChooseCard()));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 10),
            child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.name,
                  style: const TextStyle(fontSize: 20),
                )),
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
                  widget.photo,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
