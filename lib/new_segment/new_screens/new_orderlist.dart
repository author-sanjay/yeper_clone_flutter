import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/new_segment/controller_new/deals_controllers/order_list_controller.dart';
import 'package:yeper_user/new_segment/controller_new/deals_controllers/single_product_controller.dart';
import 'package:yeper_user/new_segment/new_models/deals_models/single_product_model.dart';
import 'package:yeper_user/new_segment/new_screens/new_screen_order_details.dart';
import 'package:yeper_user/new_segment/reusable_widget/common_app_shimmer.dart';
import 'package:yeper_user/new_segment/reusable_widget/reusable_chached_image.dart';
import 'package:yeper_user/new_segment/utils/utils.dart';
import '../controller_new/auth_controllers/user_details_controller.dart';
import 'new_my_profile_page.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});
  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  OrderListController orderListController = Get.find<OrderListController>();
  UserDetailsController _userDetailsController =
      Get.find<UserDetailsController>();

  SingleProductController _singleProductController =
      Get.find<SingleProductController>();

  List<SingleProductModel> listOfDiscount = [];
  bool isLoading = true;


 Future<void> _fetchUserDetails() async {
    await _userDetailsController.getuser();
  }

  Future<void> getSingle() async {
    for (int i = 0; i < orderListController.getOrderList.length; i++) {
      await _singleProductController
          .getSingleProduct(orderListController.getOrderList[i].deal!)
          .then((value) => listOfDiscount.add(value));
    }
  }

  Future<void> GetOrders() async {
    await orderListController.getOrders();
    await getSingle();
    isLoading = false;
    setState(() {});
  }

 

  @override
  void initState() {
     _fetchUserDetails();
    GetOrders();
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 10.h,
              decoration: BoxDecoration(
                  color: Color(0xff1C2039),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                ),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => MyProfilePageNew(
                            getUserInfo:
                                _userDetailsController.userDetailsModel.value),
                      );
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _userDetailsController
                                    .userDetailsModel.value.photo ==
                                null
                            ? Image.network(
                                "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                _userDetailsController
                                    .userDetailsModel.value.photo
                                    .toString(),
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              )),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Hi ${_userDetailsController.userDetailsModel.value.name}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(
                "Order Page ",
                style: TextStyle(
                    color: Color(0xff212223),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Obx(() {
                return orderListController.getOrderList.length > 0
                    ? ListView.builder(
                        itemCount: orderListController.getOrderList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: InkWell(
                                  onTap: () {
                                    if (!isLoading) {
                                      Get.to(
                                        () => OrderDetailsPage(
                                            item: listOfDiscount[
                                                orderListController
                                                        .getOrderList.length -
                                                    1 -
                                                    index],
                                            itemForUpdate: orderListController
                                                    .getOrderList[
                                                orderListController
                                                        .getOrderList.length -
                                                    1 -
                                                    index]),
                                      );
                                    } else {
                                      ShowSnackBar("Wait, data is Loading...");
                                    }
                                  },
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 70,
                                                    height: 70,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: orderListController
                                                                    .getOrderList
                                                                    .length ==
                                                                listOfDiscount
                                                                    .length
                                                            ? reusableChachedImage(
                                                                listOfDiscount[orderListController
                                                                            .getOrderList
                                                                            .length -
                                                                        1 -
                                                                        index]
                                                                    .photourl
                                                                    .toString())
                                                            : CommonAppShimmer
                                                                .rectangular(
                                                                height: 70,
                                                                width: 70,
                                                              )),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 35.w,
                                                              child: Text(
                                                                orderListController
                                                                    .getOrderList[orderListController
                                                                            .getOrderList
                                                                            .length -
                                                                        1 -
                                                                        index]
                                                                    .product
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    height:
                                                                        1.25),
                                                              ),
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
                                                                  "Accepted on ${orderListController.getOrderList[orderListController.getOrderList.length - 1 - index].date}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              .7),
                                                                      fontSize:
                                                                          8,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                Text(
                                                                  "Amazon Pay Card",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              .7),
                                                                      fontSize:
                                                                          8,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 18,
                                                            ),
                                                            orderListController
                                                                        .getOrderList
                                                                        .length ==
                                                                    listOfDiscount
                                                                        .length
                                                                ? Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        children: [
                                                                          Text(
                                                                            "You Spent",
                                                                            style: TextStyle(
                                                                                color: Colors.black.withOpacity(.7),
                                                                                fontSize: 9,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          Text(
                                                                            listOfDiscount[orderListController.getOrderList.length - 1 - index].actualPrice.toString(),
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          Text(
                                                                            "You Get",
                                                                            style: TextStyle(
                                                                                color: Colors.black.withOpacity(.7),
                                                                                fontSize: 9,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          Text(
                                                                            listOfDiscount[orderListController.getOrderList.length - 1 - index].offerPrice.toString(),
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          Text(
                                                                            "Total Earning",
                                                                            style: TextStyle(
                                                                                color: Colors.black.withOpacity(.7),
                                                                                fontSize: 9,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          Text(
                                                                            listOfDiscount[orderListController.getOrderList.length - 1 - index].userEarning.toString(),
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )
                                                                : CommonAppShimmer
                                                                    .rectangular(
                                                                        height:
                                                                            30),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            // Row(
                                                            //   children: [
                                                            //     Container(
                                                            //       padding: EdgeInsets
                                                            //           .symmetric(
                                                            //               horizontal:
                                                            //                   4.w,
                                                            //               vertical:
                                                            //                   0.8.h),
                                                            //       decoration: BoxDecoration(
                                                            //           color: Color(
                                                            //               0xff1C2039),
                                                            //           borderRadius:
                                                            //               BorderRadius
                                                            //                   .circular(
                                                            //                       6)),
                                                            //       child: Center(
                                                            //           child: Text(
                                                            //         "Enter Order Id",
                                                            //         style: TextStyle(
                                                            //             color: Colors
                                                            //                 .white,
                                                            //             fontSize: 8,
                                                            //             fontWeight:
                                                            //                 FontWeight
                                                            //                     .w700),
                                                            //       )),
                                                            //     ),
                                                            //     SizedBox(
                                                            //       width: 20,
                                                            //     ),
                                                            //     Column(
                                                            //       children: [
                                                            //         Text(
                                                            //           "not order yet ?",
                                                            //           style: TextStyle(
                                                            //               color: Colors
                                                            //                   .black,
                                                            //               fontSize:
                                                            //                   12,
                                                            //               fontWeight:
                                                            //                   FontWeight
                                                            //                       .w400),
                                                            //         ),
                                                            //         Text(
                                                            //           "Order Now",
                                                            //           style: TextStyle(
                                                            //               color: Color(
                                                            //                   0xff1C2039),
                                                            //               fontSize:
                                                            //                   16,
                                                            //               fontWeight:
                                                            //                   FontWeight
                                                            //                       .w700),
                                                            //         )
                                                            //       ],
                                                            //     ),
                                                            //   ],
                                                            // ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                top: 1,
                                                right: 5,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff1C2039),
                                                  radius: 10,
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          );
                        })
                    : Center(child: Text("No Order Found..."));
              }),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Card(
            //     elevation: 5,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     child: Container(
            //       width: double.infinity,
            //       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Stack(
            //             children: [
            //               Row(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     width: 70,
            //                     height: 70,
            //                     child: ClipRRect(
            //                       borderRadius: BorderRadius.circular(10),
            //                       child: Image.network(
            //                         "https://images.pexels.com/photos/7742555/pexels-photo-7742555.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     width: 16,
            //                   ),
            //                   Expanded(
            //                     child: Column(
            //                       children: [
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Apple\nRefurbished iPhone\nXR \128GB (Any Colour)",
            //                               style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: 12,
            //                                   fontWeight: FontWeight.w700,
            //                                   height: 1.25),
            //                             ),
            //                             SizedBox(
            //                               height: 12,
            //                             ),
            //                             Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 Text(
            //                                   "Accepted on 09 Mar 2022",
            //                                   style: TextStyle(
            //                                       color: Colors.black
            //                                           .withOpacity(.7),
            //                                       fontSize: 8,
            //                                       fontWeight: FontWeight.w400),
            //                                 ),
            //                                 Text(
            //                                   "Amazon Pay Card",
            //                                   style: TextStyle(
            //                                       color: Colors.black
            //                                           .withOpacity(.7),
            //                                       fontSize: 8,
            //                                       fontWeight: FontWeight.w400),
            //                                 ),
            //                               ],
            //                             ),
            //                             SizedBox(
            //                               height: 18,
            //                             ),
            //                             Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 Column(
            //                                   children: [
            //                                     Text(
            //                                       "You Spent",
            //                                       style: TextStyle(
            //                                           color: Colors.black
            //                                               .withOpacity(.7),
            //                                           fontSize: 9,
            //                                           fontWeight:
            //                                               FontWeight.w400),
            //                                     ),
            //                                     SizedBox(
            //                                       height: 6,
            //                                     ),
            //                                     Text(
            //                                       "₹ 50,000",
            //                                       style: TextStyle(
            //                                           color: Colors.black,
            //                                           fontSize: 12,
            //                                           fontWeight:
            //                                               FontWeight.w700),
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     Text(
            //                                       "You Spent",
            //                                       style: TextStyle(
            //                                           color: Colors.black
            //                                               .withOpacity(.7),
            //                                           fontSize: 9,
            //                                           fontWeight:
            //                                               FontWeight.w400),
            //                                     ),
            //                                     SizedBox(
            //                                       height: 6,
            //                                     ),
            //                                     Text(
            //                                       "₹ 50,000",
            //                                       style: TextStyle(
            //                                           color: Colors.black,
            //                                           fontSize: 12,
            //                                           fontWeight:
            //                                               FontWeight.w700),
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 Column(
            //                                   children: [
            //                                     Text(
            //                                       "You Spent",
            //                                       style: TextStyle(
            //                                           color: Colors.black
            //                                               .withOpacity(.7),
            //                                           fontSize: 9,
            //                                           fontWeight:
            //                                               FontWeight.w400),
            //                                     ),
            //                                     SizedBox(
            //                                       height: 6,
            //                                     ),
            //                                     Text(
            //                                       "₹ 50,000",
            //                                       style: TextStyle(
            //                                           color: Colors.black,
            //                                           fontSize: 12,
            //                                           fontWeight:
            //                                               FontWeight.w700),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ],
            //                             ),
            //                             SizedBox(
            //                               height: 10,
            //                             ),
            //                             Row(
            //                               children: [
            //                                 Expanded(
            //                                   child: Text(
            //                                     "Your Payment will Be released by 2022-04-21 11;59 pm For any Query please contact to our playment support team",
            //                                     style: TextStyle(
            //                                         color: Colors.red,
            //                                         fontSize: 8,
            //                                         fontWeight:
            //                                             FontWeight.w400),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             SizedBox(
            //                               height: 8,
            //                             ),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Positioned(
            //                 top: 1,
            //                 right: 5,
            //                 child: CircleAvatar(
            //                   backgroundColor: Color(0xffA6A6A6),
            //                   radius: 10,
            //                   child: Icon(
            //                     Icons.check,
            //                     color: Colors.white,
            //                     size: 10,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
