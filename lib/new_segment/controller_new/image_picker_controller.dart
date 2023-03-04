import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../Storage.dart';

class ImagePickerController extends GetxController {
  var image = "".obs;

  Future pickImageFromGallery(BuildContext context) async {
    SimpleFontelicoProgressDialog loader =
        SimpleFontelicoProgressDialog(context: context);

    try {
      loader.show(message: "Uploading Image...");
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 100);
      if (image == null) {
        loader.hide();
        return;
      }
      File? imageTemp = File(image.path);
      imageTemp = await _cropImage(imagefile: imageTemp);
      // this.image.value = imageTemp!.path;
      await Storage()
          .uploadfile(imageTemp!.path, imageTemp!.path.split('/').last)
          .then((result) {
        this.image.value = result;
        print("file name" + imageTemp!.path.split('/').last);
        loader.hide();
      });
    } on PlatformException catch (e) {
      loader.hide;
      print('Failed to pick image: $e');
    }
    update();
     loader.hide;
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );
      if (image == null) return;

      File? imageTemp = File(image.path);
      imageTemp = await _cropImage(imagefile: imageTemp);
      this.image.value = imageTemp!.path;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    update();
  }

  Future _cropImage({required File imagefile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imagefile.path,
      cropStyle: CropStyle.circle,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
  
    if (croppedImage == null) {
      return null;
    }
    return File(croppedImage.path);
  }
}
