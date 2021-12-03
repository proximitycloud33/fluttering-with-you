import 'package:flutter/material.dart';
import 'package:fluttering_with_you/screens/detail_screen.dart';
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('material')
            .withConverter<Map<String, dynamic>>(
              fromFirestore: (snapshot, options) =>
                  snapshot.data() ?? Map<String, dynamic>(),
              toFirestore: (value, options) => Map<String, dynamic>.from(value),
            )
            .snapshots(),
        builder: (context, snapshot) {
          int? itemLength = snapshot.data?.docs.length;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: itemLength,
              itemBuilder: (context, index) {
                Map<String, dynamic> docs = snapshot.data!.docs[index].data();
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DetailScreen(
                            materialControllerText: docs['material'],
                            title: docs['title'],
                          );
                        },
                      ));
                    },
                    child: Container(
                      width: 100.h,
                      height: 35.w,
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
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(docs['title'],
                                    style: ThemeText.headingOne),
                                SizedBox(height: 5.0),
                                Text(
                                  docs['description'],
                                  style: ThemeText.paragraph,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('No Data', style: ThemeText.paragraph);
          }
        },
      ),
    );
  }
}
