import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String output;
  int statusCode;
  String memory;
  String cpuTime;

  PostResult({
    required this.output,
    required this.statusCode,
    required this.memory,
    required this.cpuTime,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      output: object['output'],
      statusCode: object['statusCode'],
      memory: object['memory'],
      cpuTime: object['cpuTime'],
    );
  }
  static Future<PostResult> connectionToAPI(String script) async {
    String apiURL = 'https://api.jdoodle.com/v1/execute';
    String apiURLCreditSpent = 'https://api.jdoodle.com/v1/credit-spent';
    String clientId = '6f953f9966b860aa866e961e74782a11';
    String clientSecret =
        'cf382495cbf6611d49fd7096a88bd0555d52f4ed3680367744505bb92995d66c';
    String language = 'dart';
    String versionIndex = '0';
    var headers = {
      "Content-type": "application/json",
    };
    var body = {
      'clientId': clientId,
      'clientSecret': clientSecret,
      'script': script,
      'language': language,
      'versionIndex': versionIndex,
    };
    var bodyEncode = json.encode(body);

    var apiResult = await http.post(
      Uri.parse(apiURL),
      headers: headers,
      body: bodyEncode,
    );
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      return PostResult.createPostResult(jsonObject);
    } else {
      throw Exception('Failed to connect to the server');
    }
  }
}
