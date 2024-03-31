import 'dart:convert';

import 'package:task_1/models/program_model.dart';
import 'package:http/http.dart' as http;

Future<ProgramForYouModel> programforyouapi() async {
  var programforyou;
  var url = "https://632017e19f82827dcf24a655.mockapi.io/api/programs";

  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body.toString());
  print("///////");
  if (response.statusCode == 200) {
    programforyou = ProgramForYouModel.fromJson(data);
  }
  print("?????");
  return programforyou;
}
