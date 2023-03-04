import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:sizer/sizer.dart';
import 'package:yeper_user/Screens/HomeScreen/HomeScreen.dart';
import 'package:yeper_user/new_segment/controller_new/image_picker_controller.dart';
import 'package:yeper_user/new_segment/new_models/user_details_get_model.dart';
import 'package:yeper_user/new_segment/new_screens/home_screens_new.dart';
import 'package:yeper_user/new_segment/new_screens/navbar_new_screen.dart';

import '../../Storage.dart';
import '../controller_new/auth_controllers/user_details_controller.dart';
import '../controller_new/edit_profile_controller.dart/edit_profile_controller.dart';
import '../reusable_widget/reusable_button.dart';
import '../reusable_widget/reusable_chached_image.dart';
import '../reusable_widget/reusable_underline_textfield.dart';
import '../utils/utils.dart';

class EditProfilePage extends StatefulWidget {
  final UserDetailsModel getUserInfo;
  const EditProfilePage({
    super.key,
    required this.getUserInfo,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController accountnumbercontroller = TextEditingController();
  TextEditingController banknamecontroller = TextEditingController();
  TextEditingController ifsccodecontroller = TextEditingController();

  ImagePickerController _imagePickerController =
      Get.find<ImagePickerController>();
  UserDetailsController _userDetailsController =
      Get.find<UserDetailsController>();
  Future<void> _fetchUserDetails() async {
    await _userDetailsController.getuser();
  }

  Future<void> pickImage() async {
    await _imagePickerController.pickImageFromGallery(context);

    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();
  void _sumbit() {
    EditProfileController().updateProfile(
        emailcontroller.text,
        phonecontroller.text,
        accountnumbercontroller.text,
        banknamecontroller.text,
        ifsccodecontroller.text,
        _imagePickerController.image.value == ""
            ? widget.getUserInfo.photo != null
                ? widget.getUserInfo.photo
                : "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg"
            : _imagePickerController.image.value);
    _fetchUserDetails();
   
    Get.offAll(() => NavbarNewScreen());
  }

  @override
  void initState() {
    emailcontroller.text = getFormatedString(widget.getUserInfo.email);
    phonecontroller.text = getPhoneString(widget.getUserInfo.phonenumber);
    accountnumbercontroller.text =
        getFormatedString(widget.getUserInfo.acnumber);
    banknamecontroller.text = getFormatedString(widget.getUserInfo.bankname);
    ifsccodecontroller.text = getFormatedString(widget.getUserInfo.idfc);

    super.initState();
  }

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
          " Edit Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.amber, shape: BoxShape.circle),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Obx(() {
                              return SizedBox(
                                height: 100,
                                width: 100,
                                child: _imagePickerController.image.value == ""
                                    ? widget.getUserInfo.photo != null
                                        ? Image.network(
                                            widget.getUserInfo.photo,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          )
                                        : reusableChachedImage(
                                            "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg",
                                            BoxFit.fill)
                                    : SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(
                                          _imagePickerController.image.value,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              );
                            })),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: InkWell(
                          onTap: () async {
                            pickImage();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.add,
                              color: Color(0xff1C2039),
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                ReusableUnderlineTextfield(
                  title: "Email",
                  controller: emailcontroller,
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                ReusableUnderlineTextfield(
                  title: "Phone Number",
                  controller: phonecontroller,
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                ReusableUnderlineTextfield(
                  title: "Account Number",
                  controller: accountnumbercontroller,
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                ReusableUnderlineTextfield(
                  title: "Bank Name",
                  controller: banknamecontroller,
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                ReusableUnderlineTextfield(
                  title: "IFSC CODE",
                  controller: ifsccodecontroller,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  child: ReusableButton(
                    text: "SAVE",
                    onTap: _sumbit,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
