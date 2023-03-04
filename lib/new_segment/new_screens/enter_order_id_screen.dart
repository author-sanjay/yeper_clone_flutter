import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/new_segment/new_models/deals_models/get_all_deals_model.dart';
import 'package:yeper_user/new_segment/reusable_widget/reusable_chached_image.dart';
import 'package:yeper_user/new_segment/utils/utils.dart';
import '../controller_new/deals_controllers/orders_item_controller.dart';
import '../reusable_widget/reusable_underline_textfield.dart';
import 'new_orderlist.dart';

class EnterOrderIdScreen extends StatefulWidget {
  final GetAllDealsModel item;
  const EnterOrderIdScreen({
    super.key,
    required this.item,
  });

  @override
  State<EnterOrderIdScreen> createState() => _EnterOrderIdScreenState();
}

class _EnterOrderIdScreenState extends State<EnterOrderIdScreen> {
  TextEditingController _orderIdController = TextEditingController();
  OrderItemController orderItemController = Get.find<OrderItemController>();

  Future<void> _placeOrder() async {
    if (_orderIdController.text.isNumericOnly) {
      await orderItemController.orderItem(
          widget.item,
          int.parse(
            _orderIdController.text,
          ),
          context);
      Get.off(() => OrderListPage());
    } else {
      ShowSnackBar("Id should be in Numbers only");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xff1C2039),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/images/back.png",
                                          scale: 5,
                                        ),
                                        Text(
                                          " Order Details",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Image.asset(
                                          "assets/images/back.png",
                                          color: Colors.transparent,
                                          scale: 5,
                                        ),
                                      ]),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        " Order Id\nNot placed",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Spacer(
                                        flex: 8,
                                      ),
                                      Text(
                                        " Your Profit\n${widget.item.userEarning}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Amazon",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      // Container(
                                      //   padding: EdgeInsets.symmetric(
                                      //       horizontal: 10, vertical: 5),
                                      //   decoration: BoxDecoration(
                                      //       color: Colors.green,
                                      //       borderRadius:
                                      //           BorderRadius.circular(10)),
                                      //   child: Text(
                                      //     "Status:Placed",
                                      //     style: TextStyle(
                                      //         color: Colors.white,
                                      //         fontSize: 14,
                                      //         fontWeight: FontWeight.w700),
                                      //   ),
                                      // )
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "Status: Unplaced",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                ReusableUnderlineTextfield(
                                    title: "Plaform Order ID",
                                    controller: _orderIdController),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't Have One?",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      " Click here",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 48,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Order Summary",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "You Pay : ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              widget.item.actualPrice
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Card : ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              " SBI Super Card",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "You Get : ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              widget.item.offerPrice.toString(),
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Profit : ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              widget.item.userEarning
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                          // ReusableUnderlineTextfield(
                          //   title: "Delivery Address",
                          //   controller: _addressController,
                          //   isReadOnly: true,
                          // ),

                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: _placeOrder,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xff1C2039),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                        ],
                      ),
                      Positioned(
                        top: 60,
                        child: SizedBox(
                          width: 130,
                          height: 170,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: reusableChachedImage(
                                widget.item.photourl.toString(),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
