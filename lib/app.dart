import 'package:flutter/material.dart';
import 'package:renasya_prefb/firestorex.dart.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Reize',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const FirestoreX());
  }
}
