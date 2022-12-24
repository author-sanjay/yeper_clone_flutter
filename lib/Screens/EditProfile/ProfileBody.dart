// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, file_names, use_build_context_synchronously, unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/EditProfile/EditProfile.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/Screens/LoginScreen/Components/Body.dart';
import 'package:http/http.dart' as http;
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/api.dart';

import '../../Storage.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  Map<String, String> headers = {"Content-type": "application/json"};
  Future<void> post(String? email, String? phonenumber, String? ac,
      String? bankname, String? idfc, String? photo) async {
    // print("$email  $phonenumber $ac $bankname $idfc $photo");
    final json = jsonEncode({
      "email": email,
      "phonenumber": phonenumber,
      "acnumber": ac,
      "bankname": bankname,
      "idfc": idfc,
      "photo": photo
    });

    var res = await http.put(
        Uri.parse(api + "/user/update/" + user.id.toString()),
        headers: headers,
        body: json);

    try {
      final result = jsonDecode(res.body);
      print(result);

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
    // String? id = user.id;
    // String? name = user.name;
    String? email = user.email;
    String? phonenumber = user.phonenumber;
    // String? address = user.address;
    // String? referalcode = user.referalcode;
    // String? referedby = user.referedby;
    String? acnumber = user.acnumber;
    String? bankname = user.bankname;
    String? idfc = user.idfc;
    String? photo = user.photo;
    final Storage storage = Storage();
    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(255, 181, 114, 20),
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
                        backgroundColor: Colors.white,
                        child: Center(
                          child: GestureDetector(
                            onTap: (() async {
                              final results =
                                  await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                type: FileType.image,
                              );
                              if (results == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("File not selected"),
                                ));
                                return null;
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("File selected"),
                                ));
                              }
                              final path = results.files.single.path;
                              final filename = results.files.single.name;
                              // ignore: avoid_print
                              storage
                                  .uploadfile(path!, filename)
                                  .then(((result) {
                                // deals("", "", "", "", "", "", 0, widget.photourl!);

                                setState(() {
                                  // deal.photo = result;
                                  // widget.photo = result;
                                  photo = result;
                                  user.photo = result;
                                });
                              }));
                            }),
                            child: 
                             user.photo?.length==0?
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.2,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/logo.png"),
                      radius: MediaQuery.of(context).size.width * 0.02,
                    ),
                  ): CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.2,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(user.photo.toString()),
                            radius: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ),
                           
                          ),
                        )),

                    SizedBox(
                      height: 10,
                    ),
                    Text("Sanjay Kumar",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.w300)),
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
                                    acnumber = value;
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
                        post(
                            email.toString(),
                            phonenumber.toString(),
                            acnumber.toString(),
                            bankname.toString(),
                            idfc.toString(),
                            photo.toString());
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
