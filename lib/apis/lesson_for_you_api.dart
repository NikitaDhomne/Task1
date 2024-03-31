import 'dart:convert';

import 'package:task_1/models/lessons_model.dart';

import 'package:http/http.dart' as http;

Future<LessonModel> lessonforyouapi() async {
  var lessonforyou;
  var url = "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";

  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body.toString());
  print("///////");
  if (response.statusCode == 200) {
    lessonforyou = LessonModel.fromJson(data);
  }
  print("?????");
  return lessonforyou;
}
