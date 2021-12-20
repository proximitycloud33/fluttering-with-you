import 'package:flutter/material.dart';
import 'package:fluttering_with_you/screens/tab_screen.dart';
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
import 'package:sizer/sizer.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListMaterialScreen extends StatelessWidget {
  final String materialName;
  const ListMaterialScreen({Key? key, required this.materialName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstoreStream = FirebaseFirestore.instance
        .collection('material')
        .orderBy('createdAt')
        .where('tags', arrayContainsAny: [materialName])
        .withConverter<Map<String, dynamic>>(
          fromFirestore: (snapshot, options) =>
              snapshot.data() ?? <String, dynamic>{},
          toFirestore: (value, options) => Map<String, dynamic>.from(value),
        )
        .snapshots();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.accentColor,
            ),
          ),
          title: Text(
            'Fluttering With You',
            style: ThemeText.headingOne,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
        ),
        backgroundColor: AppColor.primaryColor,
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firstoreStream,
          builder: (context, snapshot) {
            int? itemLength = snapshot.data?.docs.length;
            if (snapshot.hasData ||
                ConnectionState.done == snapshot.connectionState) {
              return Scrollbar(
                interactive: true,
                radius: Radius.circular(15.0),
                child: ListView.builder(
                  itemCount: itemLength,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> docs =
                        snapshot.data!.docs[index].data();
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TabScreen(
                              materialControllerText: docs['material'],
                              materialTitle: docs['title'],
                              materialTags: <String>[...docs['tags']],
                            );
                          },
                        ));
                      },
                      child: Container(
                        width: 80.h,
                        height: 36.w,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.0),
                          ),
                        ),
                        // testing using list tile
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      docs['title'],
                                      style: ThemeText.headingOne,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                        maxHeight: 8.h,
                                        maxWidth: 70.w,
                                      ),
                                      child: Text(
                                        docs['description'],
                                        style: ThemeText.paragraph,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
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
                    );
                  },
                ),
              );
            } else {
              if (ConnectionState.waiting == snapshot.connectionState) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasError) {
                // print(snapshot.error);
                return Center(
                  child: Text(
                    '${snapshot.error}',
                    style: ThemeText.headingOne,
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'Data Not Found',
                    style: ThemeText.headingOne,
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
