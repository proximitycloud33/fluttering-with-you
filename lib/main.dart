import 'package:flutter/material.dart';
// screen & widgets
import 'package:fluttering_with_you/screens/detail_screen.dart';
import 'package:fluttering_with_you/screens/home_screen.dart';
import 'package:fluttering_with_you/screens/code_editor_screen.dart';
import 'package:fluttering_with_you/widget/tab_item.dart';
// packages
import 'package:sizer/sizer.dart';
// firstore
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widget = [
    HomeScreen(),
    CodeEditorScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Fluttering With You',
          home: SafeArea(
            child: Scaffold(
              // indexed stack
              body: IndexedStack(
                index: _selectedIndex,
                children: const [
                  HomeScreen(),
                  CodeEditorScreen(),
                ],
              ),
              bottomNavigationBar: myBottomNavigationBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              ),
            ),
          ),
        );
      },
    );
  }
}
