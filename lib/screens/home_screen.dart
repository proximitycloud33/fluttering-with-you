import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttering_with_you/screens/material_detail_screen.dart';
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttering_with_you/screens/list_material_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Pagi';
    }
    if (hour < 15) {
      return 'Siang';
    }
    if (hour < 19) {
      return 'Sore';
    }
    return 'Malam';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fluttering With You',
          style: ThemeText.headingOne,
        ),
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      backgroundColor: AppColor.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 90.w,
                height: 35.h,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100.w,
                        height: 18.h,
                        child: Image.asset(
                          'lib/assets/images/Coding_Outline.png',
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Selamat ${greeting()}',
                        style: ThemeText.headingOne,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        Greetings.spiritGreetings[Random().nextInt(2)] +
                            ', Mau belajar apa hari ini? ',
                        style: ThemeText.paragraph,
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              SizedBox(height: 3.h),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ListMaterialScreen(
                        materialName: 'dart',
                      );
                    },
                  ));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    width: 90.w,
                    height: 15.h,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dart',
                              style: ThemeText.headingOne,
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: AppColor.accentColor,
                              size: 10.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ListMaterialScreen(
                        materialName: 'flutter',
                      );
                    },
                  ));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    width: 90.w,
                    height: 15.h,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Flutter',
                              style: ThemeText.headingOne,
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: AppColor.accentColor,
                              size: 10.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
