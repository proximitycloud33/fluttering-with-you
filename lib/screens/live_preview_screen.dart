import 'package:flutter/material.dart';
import 'package:fluttering_with_you/model/live_widget_model.dart';

class LivePreview extends StatefulWidget {
  final String flutterMaterialTitle;
  const LivePreview({Key? key, required this.flutterMaterialTitle})
      : super(key: key);

  @override
  _LivePreviewState createState() => _LivePreviewState();
}

class _LivePreviewState extends State<LivePreview> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: liveWidget[widget.flutterMaterialTitle.toLowerCase()],
    );
  }
}
