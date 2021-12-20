import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_with_you/model/flash_card_result_model.dart';
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:sizer/sizer.dart';

class FlashCardScreen extends StatefulWidget {
  List listOfFlashCard = [];
  FlashCardScreen({Key? key, required this.listOfFlashCard}) : super(key: key);

  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  // late String _testing;
  // FlashCardDataModel flashCardDataList = FlashCardDataModel();
  // Stream<QuerySnapshot<Map<String, dynamic>>> firestoreStream =
  //     FirebaseFirestore.instance.collection('flash_card').snapshots();
  // void getDocs()  {
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection('flash_card').get();
  //   for (int i = 0; i < querySnapshot.size; i++) {
  //     var data = querySnapshot.docs[i].data();
  //     listOfFlashCard.add(data);
  //   }
  //   print(listOfFlashCard);
  // }
  // CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection('flash_card');

  @override
  void initState() {
    super.initState();

    // listOfFlashCard.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    widget.listOfFlashCard.shuffle();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Flash Card', style: ThemeText.headingOne),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.accentColor,
          ),
        ),
      ),
      backgroundColor: AppColor.primaryColor,
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 5.h),
            SlimyCard(
              color: AppColor.secondaryColor,
              width: 85.w,
              topCardHeight: 35.h,
              bottomCardHeight: 35.h,
              borderRadius: 15.0,
              slimeEnabled: true,
              topCardWidget: myTopCardWidget(),
              bottomCardWidget: myBottomCardWidget(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.popAndPushNamed(context, '/flash_card');
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  FlashCardScreen(listOfFlashCard: widget.listOfFlashCard),
              // transitionDuration: Duration.zero,
            ),
          );
          // Navigator.pop(context);
          // _FlashCardScreenState().initState();
        },
        child: Icon(
          Icons.arrow_forward,
          color: AppColor.accentColor,
        ),
        backgroundColor: AppColor.secondaryColor,
      ),
    );
  }

  Widget myTopCardWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            // 200 max
            Text(
              // widget.listOfFlashCard[0]['statement'],
              widget.listOfFlashCard[0]['statement'],
              style: ThemeText.headingOne,
            ),
          ],
        ),
      ),
    );
  }

  Widget myBottomCardWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topLeft,
        child: Text(
          widget.listOfFlashCard[0]['answer'],
          style: ThemeText.headingOne,
        ),
      ),
    );
  }
}
