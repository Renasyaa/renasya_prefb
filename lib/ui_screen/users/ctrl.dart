import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:renasya_prefb/models/user.dart';

Future create(Map<String, dynamic> data) async {
  final docId = data['id'];
  final nama = data['nama'];
  final createAt = data['created_at'];
  await FirebaseFirestore.instance
      .collection('username')
      .doc(docId)
      .set({'nama': nama, 'id': docId, 'created_at': createAt});
  await FirebaseFirestore.instance.collection('userDetail').doc(docId).set(data);
}

Future<List<UserX>> getColl() async {
  List<UserX> userList = [];

  // final result = await FirebaseFirestore.instance.collection('username').get();
  // await FirebaseFirestore.instance.collection('username').orderBy('created_at', descending: true).limit(3).get();
  // final result =
  final result = await FirebaseFirestore.instance.collection('username').orderBy('created_at', descending: true).get();
  for (var element in result.docs) {
    // debugPrint(element.toString());
    userList.add(UserX.fromMap(element.data()));
  }
  return userList;
}

Future<UserX> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('userDetail').doc(id).get();
  final user = UserX.fromMap(result.data() ?? {});
  return user;
}
// Future<QuerySnapshot> getColl() async {
//   final result = await FirebaseFirestore.instance.collection('username').get();
//   return result;
// }

// Future<DocumentSnapshot> getDoc(String id) async {
//   final result = await FirebaseFirestore.instance.collection('userDetail').doc(id).get();
//   return result;
// }
