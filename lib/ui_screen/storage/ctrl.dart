import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:practicece/ui_screens/storages/data.dart';
import 'package:renasya_prefb/ui_screen/storage/data.dart';

Future<String> upload() async {
  final imageName = pickedFile!.name;
  final imageBytes = await pickedFile!.readAsBytes();
  final typeFoto = pickedFile!.mimeType;
  debugPrint(typeFoto);
  final metaData = SettableMetadata(
    contentType: 'image/jpg',
  );
  final uploadImage = await FirebaseStorage.instance.ref('shop/$imageName').putData(imageBytes, metaData);
  final imageUrl = await uploadImage.ref.getDownloadURL();
  debugPrint(imageUrl);
  return imageUrl;
}
