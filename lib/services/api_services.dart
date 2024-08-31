import 'dart:convert';

import 'package:api/models/post_details_model.dart';
import 'package:api/models/post_models.dart';

import 'package:http/http.dart' as http;

class ApiServices{
  //all post get
  static Future <List<PostsModel>?> fetchData() async {
    //final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final url = Uri.parse('https://reqres.in/api/users?page=2');
    final response = await http.get(url);

    if (response.statusCode == 200) {

      final jsonData = jsonDecode(response.body);
      //final postList = jsonData as List;
      final postList = jsonData['data'] as List;

      return postList.map((postJson) => PostsModel.fromJson(postJson)).toList();

    }
    else{
      print('failed');
      return null;
    }
  }
//single post get kora,,,id dite hbe alada vabe
  static Future<PostDetailsModel?> getSinglePost (String id) async{
    final url = Uri.parse('https://reqres.in/api/users/$id');
    final response = await http.get(url);

    if(response.statusCode==200){
      final decoded =jsonDecode(response.body);
      return PostDetailsModel.fromJson(decoded['data']);
    }
    else{
      print('Error is: ${response.body}');
    }
}


}