import 'package:api/services/api_services.dart';
import 'package:flutter/material.dart';

class PostCreate extends StatelessWidget {
  const PostCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Create Page'),
      ),
     floatingActionButton: FloatingActionButton(onPressed: (){
       ApiServices.createPost();
     } ,child: Icon(Icons.done),),
    );
  }
}
