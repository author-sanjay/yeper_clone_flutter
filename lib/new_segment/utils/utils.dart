import 'package:get/get.dart';

String getFormatedString(value) {
  if (value == null) {
    return "";
  }
  return value.toString();
}

String getPhoneString(value) {
  if (value == null || value == 0) {
    return "";
  }
  return value.toString();
}

String getAdressString(value) {
  if (value == null) {
    return "No Address ";
  }
  return value.toString();
}



  SnackbarController ShowSnackBar(String e) {
    return Get.showSnackbar(
        GetSnackBar(
          title: "Error",
          message: e,
          duration: const Duration(seconds: 3),
        ),
      );
  }