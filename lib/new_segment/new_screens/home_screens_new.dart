import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/new_segment/controller_new/auth_controllers/user_details_controller.dart';
import '../controller_new/deals_controllers/get_all_deals_controller.dart';
import '../reusable_widget/reusable_chached_image.dart';
import '../reusable_widget/reusable_loading_indicator.dart';
import 'new_items_details.dart';
import 'new_my_profile_page.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({super.key});
  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  GetAllDealsController _getAllDealsController =
      Get.find<GetAllDealsController>();

  UserDetailsController _userDetailsController =
      Get.find<UserDetailsController>();

  Future<void> _fetchDeals() async {
    await _getAllDealsController.getAllDeals();
  }

  Future<void> _fetchUserDetails() async {
    await _userDetailsController.getuser();
    setState(() {});
  }

  @override
  void initState() {
    _fetchUserDetails();
    _fetchDeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _fetchUserDetails();
    
    return Scaffold(
        backgroundColor: Colors.white,
        body: _getAllDealsController != 0
            ? SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: Color(0xff1C2039),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                        ),
                        child: Obx(() {
                          return Row(children: [
                            InkWell(
                              onTap: () {
                                Get.to(
                                  () => MyProfilePageNew(
                                      getUserInfo: _userDetailsController
                                          .userDetailsModel.value),
                                );
                              },
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: _userDetailsController
                                              .userDetailsModel.value.photo ==
                                          ""
                                      ? Image.network(
                                          "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          _userDetailsController
                                                  .userDetailsModel
                                                  .value
                                                  .photo ??
                                              "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        )),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Obx(() {
                              return Text(
                                "Hi " +
                                    _userDetailsController
                                        .userDetailsModel.value.name
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              );
                            }),
                          ]);
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Expanded(
                      child: Obx(() {
                        return GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.64,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 5.0,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          children: List.generate(
                            _getAllDealsController.getAllDealsModelList.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => ItemsDetailsPage(
                                        item: _getAllDealsController
                                            .getAllDealsModelList[index]));
                                  },
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(18.0),
                                                    topRight:
                                                        Radius.circular(18.0)),
                                                child: reusableChachedImage(
                                                    _getAllDealsController
                                                        .getAllDealsModelList[
                                                            index]
                                                        .photourl
                                                        .toString()),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          _getAllDealsController
                                                              .getAllDealsModelList[
                                                                  index]
                                                              .name
                                                              .toString(),
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "₹ ${_getAllDealsController.getAllDealsModelList[index].actualPrice.toString()}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            _getAllDealsController
                                                                        .getAllDealsModelList[
                                                                            index]
                                                                        .card!
                                                                        .split(
                                                                            ' ')
                                                                        .length >
                                                                    1
                                                                ? "on ${_getAllDealsController.getAllDealsModelList[index].card!.split(' ')[0]}\n${_getAllDealsController.getAllDealsModelList[index].card!.substring(_getAllDealsController.getAllDealsModelList[index].card!.indexOf(' ') + 1)}"
                                                                : "on ${_getAllDealsController.getAllDealsModelList[index].card!}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .5),
                                                                fontSize: 11),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )
            : ReusableLaodingIndicator(
                text: "Loading Data...",
              ));
  }
}
