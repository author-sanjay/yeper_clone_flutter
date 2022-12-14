// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, sized_box_for_whitespace, sort_child_properties_last, avoid_unnecessary_containers, prefer_is_empty, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yeper_user/Screens/ChooseCard/ChooseCard.dart';
import 'package:yeper_user/Screens/EditProfile/EditProfile.dart';
import 'package:yeper_user/Screens/LoginScreen/LoginScreen.dart';
import 'package:yeper_user/Screens/OrderList/OrderList.dart';
import 'package:yeper_user/Screens/ReferalList/ReferralList.dart';
import 'package:yeper_user/Screens/Register/Detailsfields.dart';
import 'package:yeper_user/Screens/Wallet/Wallet.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                user.photo?.length == 0
                    ? CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15 + 2,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/logo.png"),
                          radius: MediaQuery.of(context).size.width * 0.15,
                        ),
                      )
                    : CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15 + 2,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(user.photo.toString()),
                          radius: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                SizedBox(height: 2),
                Text(
                  user.name.toString(),
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 2),
                Container(
                  child: List(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class List extends StatefulWidget {
  const List({
    Key? key,
  }) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfile(),
              ),
            );
          }),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 47),
            padding: EdgeInsets.only(top: 32, bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(12),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WalletScreen(),
              ),
            );
          },
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Icons.wallet,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  padding: EdgeInsets.all(12),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Wallet",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderList(),
              ),
            );
          },
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Icons.shop,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  padding: EdgeInsets.all(12),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Orders",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReferralList(),
              ),
            );
          },
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  padding: EdgeInsets.all(12),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Referrals",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChooseCard(),
              ),
            );
          },
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Icons.credit_card,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(12),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Manage Cards",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Icons.help_center,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(12),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Help & Support",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _signOut();
            setState(() {});
          },
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Icon(
                    Icons.power_settings_new_outlined,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(12),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Sign Out",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
