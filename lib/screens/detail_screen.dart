import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
// import 'package:sizer/sizer.dart';
// import 'package:flutter_highlight/flutter_highlight.dart';
// import 'package:flutter_highlight/themes/atelier-sulphurpool-dark.dart';

class DetailScreen extends StatelessWidget {
  final String materialControllerText;
  final String title;
  const DetailScreen(
      {Key? key, required this.materialControllerText, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var myJSON = jsonDecode(materialControllerText);
    QuillController _materialController = QuillController(
      document: Document.fromJson(myJSON),
      selection: TextSelection.collapsed(offset: 0),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
        body: Column(
          children: [
            Expanded(
              child: QuillEditor.basic(
                controller: _materialController,
                readOnly: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
