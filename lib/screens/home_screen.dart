import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_with_you/screens/code_editor_screen.dart';
import 'package:fluttering_with_you/screens/flash_card_screen.dart';

import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
import 'package:fluttering_with_you/screens/list_material_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  Widget greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return Row(
        children: [
          Text(
            'Selamat Pagi',
            style: ThemeText.headingOne,
          ),
          SizedBox(width: 2.w),
          Icon(
            Icons.light_mode,
            color: Colors.yellow,
            size: 5.w,
          ),
        ],
      );
    }
    if (hour < 15) {
      return Row(
        children: [
          Text(
            'Selamat Siang',
            style: ThemeText.headingOne,
          ),
          SizedBox(width: 2.w),
          Icon(
            Icons.light_mode,
            color: Colors.yellow,
            size: 5.w,
          ),
        ],
      );
    }
    if (hour < 19) {
      return Row(
        children: [
          Text(
            'Selamat Sore',
            style: ThemeText.headingOne,
          ),
          SizedBox(width: 2.w),
          Icon(
            Icons.dark_mode,
            color: Colors.orange,
            size: 5.w,
          ),
        ],
      );
    }

    return Row(
      children: [
        Text(
          'Selamat Malam',
          style: ThemeText.headingOne,
        ),
        SizedBox(width: 2.w),
        Icon(
          Icons.dark_mode,
          color: Colors.lightBlue,
          size: 5.w,
        ),
      ],
    );
  }

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('flash_card');
  var listOfFlashCard = [];

  void getDocs() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('flash_card').get();
    for (int i = 0; i < querySnapshot.size; i++) {
      var data = querySnapshot.docs[i].data();
      listOfFlashCard.add(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    getDocs();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fluttering With You',
          style: ThemeText.headingOne,
        ),
        elevation: 0,
        backgroundColor: AppColor.secondaryColor,
      ),
      backgroundColor: AppColor.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 35.h,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 19.h,
                      child: Image.asset(
                        'lib/assets/images/Coding_Outline.png',
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    greeting(),
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
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: false,
                thickness: 2.5,
                radius: Radius.circular(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) {
                                return ListMaterialScreen(
                                  materialName: 'dart',
                                );
                              },
                            ),
                          );
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: AppColor.secondaryColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: 100.w,
                            height: 15.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 5.w,
                                      children: [
                                        SvgPicture.asset(
                                          'lib/assets/icon/dart-icon.svg',
                                          width: 7.w,
                                        ),
                                        Text(
                                          'Dart',
                                          style: ThemeText.headingOne,
                                        ),
                                      ],
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
                          Navigator.push(context, CupertinoPageRoute(
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
                            width: 100.w,
                            height: 15.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 5.w,
                                      children: [
                                        SvgPicture.asset(
                                          'lib/assets/icon/flutter-icon.svg',
                                          width: 7.w,
                                        ),
                                        Text(
                                          'Flutter',
                                          style: ThemeText.headingOne,
                                        ),
                                      ],
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
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CodeEditorScreen(),
                              ));
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: AppColor.secondaryColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: 100.w,
                            height: 15.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 5.w,
                                      children: [
                                        Icon(
                                          Icons.code,
                                          color: Colors.lightBlueAccent,
                                          size: 7.w,
                                        ),
                                        Text(
                                          'Live Code Playground',
                                          style: ThemeText.headingOne,
                                        ),
                                      ],
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
                          print(listOfFlashCard);

                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => FlashCardScreen(
                                        listOfFlashCard: listOfFlashCard,
                                      )));
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: AppColor.secondaryColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: 100.w,
                            height: 15.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 5.w,
                                      children: [
                                        Icon(
                                          Icons.quiz,
                                          color: Colors.lightBlueAccent,
                                          size: 7.w,
                                        ),
                                        Text(
                                          'Flash Card',
                                          style: ThemeText.headingOne,
                                        ),
                                      ],
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
            ),
          ],
        ),
      ),
    );
  }
}
