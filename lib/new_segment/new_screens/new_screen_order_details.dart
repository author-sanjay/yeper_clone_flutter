import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/new_segment/controller_new/deals_controllers/add_otp_controller.dart';
import 'package:yeper_user/new_segment/new_models/deals_models/single_product_model.dart';
import 'package:yeper_user/new_segment/new_screens/navbar_new_screen.dart';
import 'package:yeper_user/new_segment/reusable_widget/reusable_chached_image.dart';
import 'package:yeper_user/new_segment/utils/utils.dart';
import '../new_models/deals_models/order_list_model.dart';
import '../reusable_widget/reusable_underline_textfield.dart';

class OrderDetailsPage extends StatefulWidget {
  final SingleProductModel item;
  final OrderListModel itemForUpdate;
  const OrderDetailsPage({
    super.key,
    required this.item,
    required this.itemForUpdate,
  });

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  AddOTPController addOTPController = Get.find<AddOTPController>();

  final List<String> statusItems = [
    'Placed',
    'cancelled',
    'Out For Delivery',
    'Completed',
  ];

  String? statusDefaultValue;
  String? courierDefaultValue;

  final List<String> courierItems = [
    'E-Kart',
    'Delhivery',
    'Bluedart',
    'Fedex',
    'IndiaPost',
    'Others',
  ];

  TextEditingController _otpController = TextEditingController(text: "");
  TextEditingController _addressController = TextEditingController(text: "");
  TextEditingController _mobileNoController = TextEditingController(text: "");

  Future<void> getUpdate() async {
    await addOTPController.getUpdate(
      statusDefaultValue == null
          ? widget.itemForUpdate.status
          : statusDefaultValue,
      _mobileNoController.text == ""
          ? widget.itemForUpdate.phonenumberr.toString()
          : _mobileNoController.text,
      courierDefaultValue == null
          ? widget.itemForUpdate.courier
          : courierDefaultValue,
      _otpController.text == ""
          ? widget.itemForUpdate.otp.toString()
          : _otpController.text,
      widget.itemForUpdate.id.toString(),
    );
    Get.offAll(() => NavbarNewScreen());
  }

  Future<void> _save() async {
    await getUpdate();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _addressController.dispose();
    _mobileNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _mobileNoController.text =
        getPhoneString(widget.itemForUpdate.phonenumberr);
    _otpController.text = getPhoneString(widget.itemForUpdate.otp);
    _addressController.text = getAdressString(widget.item.addresssfordelivery);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 20.h,
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
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        " Order Id\n${widget.itemForUpdate.id.toString()}",
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
                                        widget.item.platform.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          widget.itemForUpdate.status != null
                                              ? "Status: ${widget.itemForUpdate.status}"
                                                  .toString()
                                              : "No Status",
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
                                  height: 16,
                                ),
                                Text(
                                  "Platform Id : ${getFormatedString(widget.itemForUpdate.platformtxnid)}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 16,
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
                                              widget.item.card.toString(),
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Status",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Container(
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  hint: Text(
                                                    widget.itemForUpdate
                                                                .status !=
                                                            null
                                                        ? widget.itemForUpdate
                                                            .status
                                                            .toString()
                                                        : "Select",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  iconSize: 20,
                                                  items: statusItems
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: statusDefaultValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      statusDefaultValue =
                                                          value as String;
                                                    });
                                                  },
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  buttonHeight: 40,
                                                  buttonWidth: 140,
                                                  itemHeight: 40,
                                                ),
                                              ),
                                            ),
                                          ],
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "courier",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Container(
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  hint: Text(
                                                    widget.itemForUpdate
                                                                .courier !=
                                                            null
                                                        ? widget.itemForUpdate
                                                            .courier
                                                            .toString()
                                                        : "Select",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  ),
                                                  iconSize: 20,
                                                  items: courierItems
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: courierDefaultValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      courierDefaultValue =
                                                          value as String;
                                                    });
                                                  },
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  buttonHeight: 40,
                                                  buttonWidth: 140,
                                                  itemHeight: 40,
                                                ),
                                              ),
                                            ),
                                            // Row(
                                            //   children: [
                                            //     Expanded(
                                            //         child: Divider(
                                            //       color: Colors.black,
                                            //       thickness: 1,
                                            //     )),
                                            //   ],
                                            // ),
                                          ],
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
                          ReusableUnderlineTextfield(
                            title: "Delivery Address",
                            controller: _addressController,
                            isReadOnly: true,
                          ),
                          ReusableUnderlineTextfield(
                              title: "Mobile Number",
                              controller: _mobileNoController),
                          ReusableUnderlineTextfield(
                              title: "Delivery Otp",
                              controller: _otpController),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: _save,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xff1C2039),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Save",
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
