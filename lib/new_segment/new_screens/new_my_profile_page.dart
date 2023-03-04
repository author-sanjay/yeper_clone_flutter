import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/new_segment/controller_new/auth_controllers/auth_controller.dart';
import 'package:yeper_user/new_segment/new_models/user_details_get_model.dart';
import 'package:yeper_user/new_segment/new_screens/help_support_new_screen.dart';
import 'package:yeper_user/new_segment/new_screens/login_screen_new.dart';
import 'package:yeper_user/new_segment/reusable_widget/reusable_chached_image.dart';
import 'new_bank_account_details.dart';
import 'new_edit_profile.dart';
import 'new_orderlist.dart';
import 'new_referral_page.dart';
import 'new_wallet_screen.dart';

class MyProfilePageNew extends StatefulWidget {
  final UserDetailsModel getUserInfo;
  const MyProfilePageNew({
    super.key,
    required this.getUserInfo,
  });

  @override
  State<MyProfilePageNew> createState() => _MyProfilePageNewState();
}

class _MyProfilePageNewState extends State<MyProfilePageNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C2039),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/back.png",
            scale: 5,
          ),
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
                    child: SizedBox(
                        height: 80,
                        width: 80,
                        child: widget.getUserInfo.photo == null
                            ? reusableChachedImage(
                                "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg")
                            : Image.network(
                                widget.getUserInfo.photo,
                                fit: BoxFit.cover,
                              ))),
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
                      widget.getUserInfo.name.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.getUserInfo.phonenumber.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.getUserInfo.email.toString(),
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
                  onTap: () {
                    Get.to(() => EditProfilePage(
                          getUserInfo: widget.getUserInfo,
                        ));
                  },
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
                  onTap: () {
                    Get.to(() => NewWalletScreen());
                  },
                  leading: Icon(
                    Icons.wallet,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Wallet",
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
                  onTap: () {
                    Get.to(() => OrderListPage());
                  },
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
                  onTap: () {
                    Get.to(() => ReferralPage());
                  },
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
                  onTap: () {
                    Get.to(() => BankDetailsPage(
                         getUserInfo: widget.getUserInfo,
                    ));
                  },
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
                InkWell(
                  onTap: () {
                    Get.to(() => SupportPage());
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.contact_support_outlined,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Support & Helps",
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
                InkWell(
                  onTap: () async {
                    AuthController authController = AuthController();
                    await authController.logout();
                    Get.to(() => LoginNewScreen());
                  },
                  child: ListTile(
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
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
