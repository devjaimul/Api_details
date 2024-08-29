import 'dart:convert';

import 'package:api/models/post_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModels> posts = [];
  Future fetchData() async {
    //final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final url = Uri.parse('https://reqres.in/api/users?page=2');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('success');
      final jsonData = jsonDecode(response.body);

      //final postList = jsonData as List;
      final postList = jsonData['data'] as List;

      for(var post in postList){
        posts.add(PostModels(name: post['first_name'], img: post['avatar']));
      }
    }
    else{
      print('failed');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image(image: NetworkImage(posts[index].img)),
              title: Text(posts[index].name,style: TextStyle(color: Colors.black),),
            ),
          );
        },
      ),
    );
  }
}
