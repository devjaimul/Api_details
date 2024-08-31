
import 'package:api/services/api_services.dart';
import 'package:api/views/post_details.dart';
import 'package:api/views/posts%20create/post_create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api '),
      ),
      body: FutureBuilder(
        future: ApiServices.fetchData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(PostDetails(id: snapshot.data![index].id.toString()));
                },
                child: Card(
                  child: ListTile(
                    leading:
                        Image(image: NetworkImage(snapshot.data![index].img)),
                    title: Text(
                      snapshot.data![index].name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(PostCreate());
      },child: Icon(Icons.add),),
    );
  }
}
