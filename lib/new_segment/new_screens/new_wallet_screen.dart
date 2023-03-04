import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/new_segment/controller_new/transaction_controller/transactioncontroller.dart';
import '../controller_new/auth_controllers/user_details_controller.dart';
import '../new_models/transaction_model_list/transactions_list_model.dart';
import 'new_my_profile_page.dart';

class NewWalletScreen extends StatefulWidget {
  const NewWalletScreen({super.key});

  @override
  State<NewWalletScreen> createState() => _NewWalletScreenState();
}

class _NewWalletScreenState extends State<NewWalletScreen> {
  UserDetailsController _userDetailsController =
      Get.find<UserDetailsController>();
  Future<void> _fetchUserDetails() async {
    await _userDetailsController.getuser();
  }

  List<Transactionslist>? _getdeals;
  int? blance;
  bool isloading = true;
  getfetch() async {
    isloading = true;
    _getdeals = await TransactionController().getDeals();
    blance = await TransactionController().getbalance();
    isloading = false;
    setState(() {});
  }

  @override
  initState() {
      _fetchUserDetails();
    getfetch();
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isloading == false
            ? Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff1C2039),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
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
                                  child:  _userDetailsController
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
                                              .userDetailsModel.value.photo,
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
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Total Balance",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$ ${blance}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Last Transactions",
                          style: TextStyle(
                              color: Color(0xff1A1A1A),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  _getdeals?.length == 0
                      ? Text("No Transaction")
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _getdeals?.length,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                      backgroundColor: Color(0xff1C2039),
                                      child: Icon(
                                        Icons.wallet,
                                        color: Colors.white,
                                      )),
                                  title: Text(
                                    (_getdeals?[index].message) ?? "No Message",
                                    style: TextStyle(
                                        color: Color(0xff1A1A1A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text(
                                    DateFormat.yMMMMEEEEd().format(
                                        DateTime.parse((_getdeals?[index].date)
                                            .toString())),
                                    style: TextStyle(
                                        color: Color(0xff1A1A1A),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  trailing: Text(
                                    "\$${_getdeals?[index].amount}",
                                    style: TextStyle(
                                        color:
                                            (_getdeals?[index].incoming) as bool
                                                ? Colors.green
                                                : Color(0xffE50300),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                );
                              })),
                        )
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
