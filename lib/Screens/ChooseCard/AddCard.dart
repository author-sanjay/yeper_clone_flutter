import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yeper_user/Screens/ChooseCard/ChooseCard.dart';
import 'package:yeper_user/Screens/HomeScreen/Components/HeaderWithSearchbar.dart';
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
    print(_getdeals);
    // print(_temp.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isloading
            ? Center(
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
                                child: Text(
                                  "Click on Cards to \nadd to your Profile",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )),
                            SizedBox(
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
              ));
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

    print(_getdeals);
    // print(_temp.length);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addcard(widget.id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChooseCard()));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 10),
            child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 20),
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
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
