import 'package:flutter/material.dart';
import 'package:renasya_prefb/ui_screen/storage/widgetsto/storage_view.dart';
// import 'package:renasya_prefb/pages/user_list.dart.dart';
// import 'package:renasya_prefb/ui_screen/users/widgets/user_list.dart.dart';
// import 'package:renasya_prefb/pages/firestorex.dart.dart';

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
      home: const StorageView(),
    );
    // home: const UserList());
  }
}
