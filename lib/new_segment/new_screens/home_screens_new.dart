
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  Future<void> _fetchDeals() async {
    await _getAllDealsController.getAllDeals();
  }

  @override
  void initState() {
    _fetchDeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _getAllDealsController != 0
            ? Column(
                children: [
                  SizedBox(
                    height: 28,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => MyProfilePage());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.black,
                                  shape: BoxShape.circle),
                              child: Container(
                                margin: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Prashant",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ]),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.card_giftcard,
                                  size: 15,
                                  color: Color(0xff848484),
                                ),
                                Text(
                                  "Refer & Earn Upto ₹10,0000",
                                  style: TextStyle(
                                      color: Color(0xff7C7C7C),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Obx(() {
                      return GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 6 / 10,
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
                                          flex: 3,
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
                                        Expanded(
                                          child: Container(
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
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "₹ ${_getAllDealsController.getAllDealsModelList[index].actualPrice.toString()}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            "on ${_getAllDealsController.getAllDealsModelList[index].card.toString()}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .5),
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Spacer(),
                                                ],
                                              )),
                                        )
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
              )
            : ReusableLaodingIndicator(
                text: "Loading Data...",
              ));
  }
}
