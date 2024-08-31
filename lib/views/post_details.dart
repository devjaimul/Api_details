import 'package:api/services/api_services.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final String id;
  const PostDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: FutureBuilder(
        future: ApiServices.getSinglePost(id),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else{
            return Center(
              child: Card(
                child: ListTile(
                  leading: Image.network(snapshot.data!.img),
                  title: Text(snapshot.data!.name),
                 // avabe get korte hbe data
                  //subtitle: Text(snapshot.data!.author.name),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
