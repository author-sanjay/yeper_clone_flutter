import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/new_segment/controller_new/refferal_controller.dart';
import 'package:yeper_user/new_segment/new_screens/view_all_refferal_list.dart';
import '../controller_new/auth_controllers/user_details_controller.dart';
import '../reusable_widget/reusable_button.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  final String textToCopyplaystorelink = "https://play.google.com/";
  final String textToCopyAppstorelink = "https://play.google.com/";
  RefferalController refferalController = RefferalController();

  UserDetailsController _userDetailsController =
      Get.find<UserDetailsController>();
  Future<void> _fetchUserDetails() async {
    await _userDetailsController.getuser();
  }

  Future<void> getRefferal() async {
    await refferalController.getReffereal();
  }

  _sumbit() {
    Share.share(
        "Play Store App Link:${textToCopyplaystorelink}\nApp Store App Link${textToCopyplaystorelink}\n Hi, Do you have an credit Card? And Want to earn rewards with it? Come!!! Join Us in Uitilizing your credit card. DOnt Forget To Use My Code:${_userDetailsController.userDetailsModel.value.referalcode}");
  }

  @override
  void initState() {
    getRefferal();
    _fetchUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                " Referral",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child:
                          _userDetailsController.userDetailsModel.value.photo ==
                                  null
                              ? Image.network(
                                  "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  _userDetailsController
                                      .userDetailsModel.value.photo,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      "Invite friends & earn flat 10% of their Cachback amount, EVERYTIME they shop!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(color: Color(0xffE5E5E5)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your Referral Link",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Invite friends & earn flat 10% of their Cachback amount, EVERYTIME they shop!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 1.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "${_userDetailsController.userDetailsModel.value.referalcode}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: _userDetailsController
                                    .userDetailsModel.value.referalcode));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Copied to clipboard'),
                              ),
                            );
                          },
                          child: Text(
                            "Tap to Copy",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Invite by Social Media",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    child: ReusableButton(
                      text: "Share",
                      onTap: _sumbit,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Referral Network",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Referral\nName",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Referral\nEarnings",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(() {
                      return Column(
                        children: [
                          refferalController.getRefferalList.length > 3
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                      onTap: () {
                                        Get.to(() => ViewAllRefferalList(
                                            list: refferalController
                                                .getRefferalList));
                                      },
                                      child: Text("View All")),
                                )
                              : SizedBox.shrink(),
                          ListView.builder(
                              itemCount:
                                  refferalController.getRefferalList.length > 3
                                      ? 3
                                      : refferalController
                                          .getRefferalList.length,
                              // itemCount: refferalController.getRefferalList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          refferalController
                                              .getRefferalList[index].name
                                              .toString(),
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          refferalController
                                              .getRefferalList[index].contri
                                              .toString(),
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Divider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ))
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        ],
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
