// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                      onTap: (() {
                        print("Hello");
                      }),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Edit Profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 50),
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
                                  "Edit Mode",
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
                          Column(
                            children: [
                              Container(
                                    margin: EdgeInsets.symmetric(horizontal: 32),
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20))),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18))),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              TextField(
                                          onChanged: (value) {
                                            print(value);
                                          },
                                          decoration: new InputDecoration(
                                              labelText: "Name"),
                                          

                                        ),
                                            ],
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                  
                                 Container(
                              margin: EdgeInsets.symmetric(horizontal: 32),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextField(
                                          onChanged: (value) {
                                            print(value);
                                          },
                                          decoration: new InputDecoration(
                                              labelText: "Email"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                  

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 32),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.lightBlue[900],
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextField(
                                          onChanged: (value) {
                                            print(value);
                                          },
                                          decoration: new InputDecoration(
                                              labelText: "Phone Number",
                                            ),
                                            keyboardType: TextInputType.number,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                  

                              Container(
                              margin: EdgeInsets.symmetric(horizontal: 32),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.lightBlue[900],
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextField(
                                          onChanged: (value) {
                                            print(value);
                                          },
                                          decoration: new InputDecoration(
                                              labelText: "Address"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                  
                            SizedBox(height: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 43,
                              decoration: BoxDecoration(
                                  color: kprimarycolor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text(
                                "Send Code",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )),
                            ),
                                 
                            ],
                          ),
                        ] 
                      )
                    )
                  );
              
                  
                }
              )
            ]
          )
        ),
      )
    );
  }
}