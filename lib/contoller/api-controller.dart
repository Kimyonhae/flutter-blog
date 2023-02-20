import 'dart:convert';

import 'package:flutter_blog/model/content.dart';
import 'package:http/http.dart' as http;

class ApiController {
  static Future<List<Post>> apiToJson(String path) async {
    var url = Uri.parse("http://172.30.1.7:3000/$path");
    var response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> decodeResponse = jsonDecode(response.body);
      var result =
          decodeResponse.map((obj) => Post.fromJson(json: obj)).toList();
      return result;
    } else {
      throw Exception("실패!");
    }
  }
}
