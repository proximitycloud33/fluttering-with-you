import 'package:flutter/material.dart';
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fluttering With You',
        ),
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      backgroundColor: AppColor.primaryColor,
      body: ListView.separated(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 100.h,
            height: 70.w,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 80.w,
                  height: 12.h,
                  margin: const EdgeInsets.all(20.0),
                  child: const Placeholder(color: AppColor.accentColor),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Container', style: ThemeText.headingOne),
                      SizedBox(height: 5.0),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: ThemeText.paragraph),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20.0);
        },
      ),
    );
  }
}
