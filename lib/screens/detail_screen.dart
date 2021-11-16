import 'package:flutter/material.dart';
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atelier-sulphurpool-dark.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var code = '''main() {
  print("Hello, World!");
}

''';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.accentColor,
          ),
        ),
        title: Text(
          'Container',
          style: ThemeText.headingOne,
        ),
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      backgroundColor: AppColor.primaryColor,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum est ultricies integer quis. Iaculis urna id volutpat lacus laoreet. Mauris vitae ultricies leo integer malesuada. Ac odio tempor orci dapibus ultrices in. Egestas diam in arcu cursus euismod. Dictum fusce ut placerat orci nulla. Tincidunt ornare massa eget egestas ',
              style: ThemeText.paragraph,
            ),
            SizedBox(height: 20.0),
            Flexible(
              child: Container(
                width: 100.w,
                child: HighlightView(
                  code,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  language: 'dart',
                  theme: atelierSulphurpoolDarkTheme,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
