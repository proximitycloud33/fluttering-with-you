import 'package:flutter/material.dart';
// screen & widgets

import 'package:fluttering_with_you/screens/list_material_screen.dart';
import 'package:fluttering_with_you/screens/code_editor_screen.dart';
import 'package:fluttering_with_you/screens/tab_screen.dart';
import 'package:fluttering_with_you/widget/tab_item.dart';
import 'package:fluttering_with_you/screens/home_screen.dart';
// packages
import 'package:sizer/sizer.dart';
// firstore
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: HomeScreen(),
        );
      },
    );
  }
}
