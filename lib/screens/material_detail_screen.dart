import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
import 'package:tuple/tuple.dart';
// import 'package:sizer/sizer.dart';
// import 'package:flutter_highlight/flutter_highlight.dart';
// import 'package:flutter_highlight/themes/atelier-sulphurpool-dark.dart';

class MaterialDetailScreen extends StatefulWidget {
  final String materialControllerText;
  final String title;
  const MaterialDetailScreen(
      {Key? key, required this.materialControllerText, required this.title})
      : super(key: key);

  @override
  State<MaterialDetailScreen> createState() => _MaterialDetailScreenState();
}

class _MaterialDetailScreenState extends State<MaterialDetailScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    FocusNode materialFocusNode = FocusNode();
    var myJSON = jsonDecode(widget.materialControllerText);
    QuillController _materialController = QuillController(
      document: Document.fromJson(myJSON),
      selection: TextSelection.collapsed(offset: 2),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: QuillEditor(
                    controller: _materialController,
                    readOnly: true,
                    autoFocus: false,
                    expands: true,
                    showCursor: false,
                    focusNode: materialFocusNode,
                    scrollController: ScrollController(),
                    padding: EdgeInsets.zero,
                    scrollable: true,
                    customStyles: DefaultStyles(
                      color: Colors.white,
                      paragraph: DefaultTextBlockStyle(
                        ThemeText.material,
                        Tuple2(0, 0),
                        Tuple2(0, 0),
                        null,
                      ),
                      code: DefaultTextBlockStyle(
                        TextStyle(color: AppColor.accentColor, fontSize: 12),
                        Tuple2(6, 0),
                        Tuple2(1, 0),
                        BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      h3: DefaultTextBlockStyle(
                          TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.25,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                          const Tuple2(8, 0),
                          const Tuple2(0, 0),
                          null),
                      lists: DefaultListBlockStyle(
                        TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        Tuple2<double, double>(6, 0),
                        Tuple2<double, double>(6, 0),
                        null,
                        null,
                      ),
                      leading: DefaultListBlockStyle(
                        TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        Tuple2<double, double>(6, 0),
                        Tuple2<double, double>(6, 0),
                        null,
                        null,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
