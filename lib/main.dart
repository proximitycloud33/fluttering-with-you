import 'package:flutter/material.dart';
import 'package:fluttering_with_you/screens/flash_card_screen.dart';
// screen & widgets

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
          // routes: {
          //   '/flash_card': (context) => const FlashCardScreen(),
          // },
          home: HomeScreen(),
        );
      },
    );
  }
}
