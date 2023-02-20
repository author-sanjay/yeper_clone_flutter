import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C2039),
        leading: Image.asset(
          "assets/images/back.png",
          scale: 5,
        ),
        title: Text(
          "My Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
                    width: 76,
                    height: 76,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Spookie Weirdo",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "8200369878",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "spookie@gmail.com",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xff1C2039),
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                        thickness: 1,
                      ),
                    )
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.wallet,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xff1C2039),
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                        thickness: 1,
                      ),
                    )
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.shop,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Orders",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xff1C2039),
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                        thickness: 1,
                      ),
                    )
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Referrals",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xff1C2039),
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                        thickness: 1,
                      ),
                    )
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.credit_card,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Manage Cards",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xff1C2039),
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                        thickness: 1,
                      ),
                    )
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.document_scanner_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Manage KYC",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xff1C2039),
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                        thickness: 1,
                      ),
                    )
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.contact_support_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Manage KYC",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xff1C2039),
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                        thickness: 1,
                      ),
                    )
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.power_settings_new,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xff1C2039),
                    size: 20,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
