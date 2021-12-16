import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:fluttering_with_you/model/post_result_model.dart';
import 'package:fluttering_with_you/utils/constants.dart';
import 'package:fluttering_with_you/utils/styles.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/atelier-sulphurpool-dark.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeEditorScreen extends StatefulWidget {
  const CodeEditorScreen({Key? key}) : super(key: key);

  @override
  _CodeEditorScreenState createState() => _CodeEditorScreenState();
}

class _CodeEditorScreenState extends State<CodeEditorScreen>
    with AutomaticKeepAliveClientMixin {
  CodeController? _codeController;
  PostResult? postResult;

  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    const source = 'void main(){\n  print(\'Hello, World\');\n}';
    _codeController = CodeController(
      text: source,
      language: dart,
      theme: atelierSulphurpoolDarkTheme,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: CodeField(
            controller: _codeController!,
            textStyle: GoogleFonts.firaCode(letterSpacing: -0.2),
            background: AppColor.primaryColor,
            expands: true,
            wrap: true,
          ),
        ),
        Flexible(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    border: Border.all(
                      width: 1.0,
                      color: AppColor.accentColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Console',
                              style: ThemeText.paragraph,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                PostResult.connectionToAPI(
                                        _codeController!.text)
                                    .then((value) => postResult = value)
                                    .whenComplete(() {
                                  setState(() {});
                                });
                              },
                              child: Row(
                                children: const [
                                  Icon(Icons.play_arrow),
                                  // SizedBox(width: 10.0),
                                  Text('Run'),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: AppColor.accentColor),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Output: ',
                          style: ThemeText.paragraph,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          postResult != null ? postResult!.output : '',
                          style: ThemeText.paragraph,
                        ),
                      ),
                      Row(
                        children: postResult != null
                            ? [
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Status Code: ' +
                                      postResult!.statusCode.toString(),
                                  style: ThemeText.paragraph,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text('CPU Time: ' + postResult!.cpuTime,
                                    style: ThemeText.paragraph),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text('Memory: ' + postResult!.memory,
                                    style: ThemeText.paragraph),
                              ]
                            : [],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
