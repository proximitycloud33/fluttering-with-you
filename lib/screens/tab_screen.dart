import 'package:flutter/material.dart';
import 'package:fluttering_with_you/screens/code_editor_screen.dart';
import 'package:fluttering_with_you/screens/live_preview_screen.dart';
import 'package:fluttering_with_you/screens/material_detail_screen.dart';
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';

class TabScreen extends StatefulWidget {
  final String materialControllerText;
  final String materialTitle;
  final List<String> materialTags;
  const TabScreen({
    Key? key,
    required this.materialControllerText,
    required this.materialTitle,
    required this.materialTags,
  }) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
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
            backgroundColor: AppColor.primaryColor,
            title: Text(
              widget.materialTitle,
              style: ThemeText.headingOne,
            ),
            centerTitle: true,
            bottom: TabBar(
                indicatorColor: AppColor.accentColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppColor.accentColor,
                unselectedLabelColor: Colors.white60,
                labelStyle: TextStyle(color: AppColor.accentColor),
                unselectedLabelStyle: TextStyle(color: AppColor.accentColor),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list_alt),
                        SizedBox(width: 5.0),
                        Text('Materi', style: ThemeText.paragraph),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.materialTags
                            .any((e) => e.contains('dart'))) ...[
                          Icon(Icons.code),
                          SizedBox(width: 5.0),
                          Text('Live Code', style: ThemeText.paragraph),
                        ] else ...[
                          Icon(Icons.phone_android),
                          SizedBox(width: 5.0),
                          Text('Live Preview', style: ThemeText.paragraph),
                        ],
                      ],
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            if (widget.materialTags.any((e) => e.contains('dart'))) ...[
              MaterialDetailScreen(
                materialControllerText: widget.materialControllerText,
                title: widget.materialTitle,
              ),
              CodeEditorScreen(),
            ] else ...[
              MaterialDetailScreen(
                materialControllerText: widget.materialControllerText,
                title: widget.materialTitle,
              ),
              LivePreview(flutterMaterialTitle: widget.materialTitle),
            ]
          ]),
        ),
      ),
    );
  }
}
