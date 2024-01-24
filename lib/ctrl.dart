import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future create(Map<String, dynamic> data) async {
  final docId = UniqueKey().toString();
  final nama = data['nama'];
  await FirebaseFirestore.instance.collection('username').doc(docId).set({'nama': nama});
  await FirebaseFirestore.instance.collection('userDetail').doc(docId).set(data);
}

Future<QuerySnapshot> getColl() async {
  final result = await FirebaseFirestore.instance.collection('username').get();
  return result;
}

Future<DocumentSnapshot> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('userDetail').doc(id).get();
  return result;
}
