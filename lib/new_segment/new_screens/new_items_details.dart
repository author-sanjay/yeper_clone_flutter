import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yeper_user/new_segment/new_screens/enter_order_id_screen.dart';
import 'package:yeper_user/new_segment/utils/utils.dart';
import '../new_models/deals_models/get_all_deals_model.dart';
import '../reusable_widget/reusable_chached_image.dart';

class ItemsDetailsPage extends StatefulWidget {
  final GetAllDealsModel item;
  const ItemsDetailsPage({
    super.key,
    required this.item,
  });

  @override
  State<ItemsDetailsPage> createState() => _ItemsDetailsPageState();
}

class _ItemsDetailsPageState extends State<ItemsDetailsPage> {
  Future<void> urll() async {
    String url = widget.item.offerlink!;
    var urllaunchable = await canLaunchUrl(Uri.parse(url));
    if (urllaunchable) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      ).then(
        (value) => Get.to(
          () => EnterOrderIdScreen(item: widget.item),
        ),
      );
    } else {
      ShowSnackBar("Can not Open Broswer");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C2039),
        title: Text(
          widget.item.name.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   width: double.infinity,
                  //   height: 30.h,
                  //   child: Image.network(
                  //     widget.item.photourl.toString(),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.item.name.toString(),
                                    style: TextStyle(
                                        color: Color(0xff1C2039),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 80,
                              child: reusableChachedImage(
                                widget.item.photourl.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: 2.w,
                  //   ),
                  //   child: Card(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Container(
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Discription",
                  //             style: TextStyle(
                  //                 color: Color(0xff1C2039),
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w700),
                  //           ),
                  //           SizedBox(
                  //             height: 1.h,
                  //           ),
                  //           Text(
                  //             widget.item.description.toString(),
                  //             style: TextStyle(
                  //                 color: Color(0xff1C2039),
                  //                 fontSize: 15,
                  //                 fontWeight: FontWeight.w400),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Key Note",
                              style: TextStyle(
                                  color: Color(0xff1C2039),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "For athletes, high altitude produces two contradictory effects on performance. For explosive events (sprints up to 400 metres, longjup, triple jump) the reduction in atmospheric pressure means there is less resistance from the atmosphere and the athlete's performance will generally be better at high altitude.",
                              style: TextStyle(
                                  color: Color(0xff1C2039),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Offer",
                              style: TextStyle(
                                  color: Color(0xff1C2039),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    widget.item.description.toString(),
                                    style: TextStyle(
                                        color: Color(0xff1C2039),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                SizedBox(
                                  height: 90,
                                  width: 80,
                                  child: reusableChachedImage(
                                      widget.item.photourl.toString()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivery Address",
                                    style: TextStyle(
                                        color: Color(0xff1C2039),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SelectableText(
                                      "Name :   ${getFormatedString(widget.item.deliverto)}\nPhone Number: 9999999999\nAddress : ${getFormatedString(widget.item.addresssfordelivery)}\nPin Code: ${getPhoneString(widget.item.addresssfordelivery)}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                        ),
                        child: Container(
                          height: 125,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/Vector.png"),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "You’ll spend",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff1C2039),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "₹ ${widget.item.actualPrice.toString()}",
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                        ),
                        child: Container(
                          height: 125,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/get.png"),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "You will get",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff1C2039),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "₹ ${widget.item.offerPrice.toString()}",
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                        ),
                        child: Container(
                          height: 125,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/wall.png"),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Total Earnings",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff1C2039),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "₹ ${widget.item.userEarning.toString()}",
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: urll,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              decoration: BoxDecoration(
                  color: Color(0xff1C2039),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(
                "Order Now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )),
            ),
          )
        ],
      ),
    );
  }
}
