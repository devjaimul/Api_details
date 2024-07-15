import 'dart:convert';

import 'package:api/models/posts_model.dart';
import 'package:http/http.dart' as http;

class ApiServices{
 static Future <List<PostsModel>?> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final postList = jsonData as List;

      return postList.map((postJson) => PostsModel.fromJson(postJson)).toList();

    } else {
      print('failed');
      return null;
    }
  }
}