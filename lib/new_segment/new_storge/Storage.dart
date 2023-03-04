// ignore_for_file: non_constant_identifier_names, avoid_print, file_names
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class NewStorage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<String> uploadfile(String filepath, String filename) async {
    File file = File(filepath);
    try {
      String st = await (await storage
              .ref(
                  'imageProfile/${FirebaseAuth.instance.currentUser?.uid}/$filename')
              .putFile(file))
          .ref
          .getDownloadURL();
      // print(st);
      return st;
    } on firebase_core.FirebaseException catch (e) {
      print(e);
      return "";
    }
  }

  Future<String> URL(String filename) {
    return firebase_storage.FirebaseStorage.instance
        .ref('/test')
        .child(filename)
        .getDownloadURL();
    // print(downloadURL);
  }
}