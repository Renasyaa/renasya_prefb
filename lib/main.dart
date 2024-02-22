import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:renasya_prefb/app/app.dart';
import 'package:renasya_prefb/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}
