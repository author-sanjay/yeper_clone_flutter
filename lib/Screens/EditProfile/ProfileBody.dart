// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, file_names, use_build_context_synchronously, unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/EditProfile/EditProfile.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/LoginScreen/Components/Body.dart';
import 'package:http/http.dart' as http;
import 'package:yeper_user/api.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  Map<String, String> headers = {"Content-type": "application/json"};
  Future<void> post(String email, String phonenumber, int ac, String bankname,
      String idfc) async {
    final json = jsonEncode({
      "email": email,
      "phonenumber": phonenumber,
      "acnumber": ac,
      "bankname": bankname,
      "idfc": idfc
    });

    var res = await http.put(
        Uri.parse(api + "/user/update/" + user.id.toString()),
        headers: headers,
        body: json);

    try {
      final result = jsonDecode(res.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditProfile(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int id = user.id;
    String name = user.name;
    String email = user.email;
    String phonenumber = user.phonenumber;
    String address = user.address;
    String referalcode = user.referalcode;
    String referedby = user.referedby;
    int acnumber = user.acnumber;
    String bankname = user.bankname;
    String idfc = user.idfc;
    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(255, 82, 29, 83),
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: (() {}),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.21,
                        child: Center(
                          child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.20,
                              backgroundImage:
                                  AssetImage("assets/images/image_1.png")),
                        )),

                    SizedBox(
                      height: 10,
                    ),
                    Text("Sanjay Kumar",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.w200)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Icon(
                              Icons.email,
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
                                TextField(
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Email"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Icon(
                              Icons.phone,
                              color: Colors.lightBlue[900],
                            ),
                            // padding: EdgeInsets.all(12),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextField(
                                  onChanged: (value) {
                                    phonenumber = value;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Phone Number"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Icon(
                              Icons.attach_money,
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
                                TextField(
                                  onChanged: (value) {
                                    acnumber = int.parse(value);
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Bank A/C Number"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
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
                                TextField(
                                  onChanged: (value) {
                                    bankname = value;
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Bank Name"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Icon(
                              Icons.pin,
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
                                TextField(
                                  onChanged: (value) {
                                    idfc = value;
                                  },
                                  decoration:
                                      InputDecoration(labelText: "IDFC Code"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        post(email, phonenumber, acnumber, bankname, idfc);
                      },
                      child: Text("Save"),
                      style: ButtonStyle(),
                    )
                    // Text("Profile Photo can ",style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.w200))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      //draggable sheet
    );
  }
}
