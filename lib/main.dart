import 'package:flutter/material.dart';
import 'package:fluttering_with_you/screens/detail_screen.dart';
// import 'package:fluttering_with_you/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluttering With You',
      home: DetailScreen(),
    );
  }
}
