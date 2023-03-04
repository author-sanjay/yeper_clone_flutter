import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:yeper_user/new_segment/controller_new/auth_controllers/enter_login_controller.dart';
import 'package:yeper_user/new_segment/new_screens/login_details_new.dart';
import 'package:yeper_user/new_segment/new_screens/navbar_new_screen.dart';
import '../../new_screens/login_screen_new.dart';
import '../../utils/utils.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  var verficationId = ''.obs;

  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
  _setInitialScreen(User? user) {
    // user == null
    //     ? Get.offAll(() => const HomeScreenNew())
    //     : Get.offAll(() => const LoginNewScreen());
  }

  Future<void> phoneAuthentication(String phoneNo, BuildContext context) async {
    // SimpleFontelicoProgressDialog _dialog =
    //     SimpleFontelicoProgressDialog(context: context);

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: ((verificationId, resendToken) {
        this.verficationId.value = verificationId;
      }),
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: Duration(seconds: 5),
      verificationFailed: (e) {
        ShowSnackBar(e.message.toString());
      },
    );
  }


  Future<bool> verifyOtp(String otp, BuildContext context) async {
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    try {
      _dialog.show(message: "Verifying OTP...");

      var credentials = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verficationId.value, smsCode: otp));
      if (credentials.user != null) {
        if (credentials.additionalUserInfo?.isNewUser == true) {
          _dialog.hide();
          Get.offAll(() => const LoginDetailNewScreen());
        } else {
          _dialog.hide();
          // Get.offAll(() => const NavbarNewScreen());
          logincontroller().login("1234", context);
        }
        return true;
      }
    } catch (e) {
      _dialog.hide();
      Get.showSnackbar(
        GetSnackBar(
          title: "Error",
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    }

    return false;
  }

  //FUNC
  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const NavbarNewScreen())
          : Get.to(() => const LoginNewScreen());
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
