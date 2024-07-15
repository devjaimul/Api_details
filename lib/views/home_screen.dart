


import 'package:api/services/api_services.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<PostsModel> posts = [];
  //
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  // TODO: implement initState
  //   fetchData();
  // }
  // fetchData() async{
  //   final data=await ApiServices.fetchData();
  //   setState(() {
  //     posts=data!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('api'),
        ),
        body: FutureBuilder(
          future: ApiServices.fetchData(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(color: Colors.blue,));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                final data = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      data.thumbnailUrl ?? "Unknown",
                      width: 60,
                      height: 60,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://imgs.search.brave.com/ojYTD4-OcjLZ8KqRKm8PP0vBdGGTbmyvtrVzdxiW35s/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAxLzAwLzA5LzY2/LzM2MF9GXzEwMDA5/NjY0NV9yNUV4SFlB/eVRGYzdwbHlVQVpN/aWs2OHFMWFlLa1gx/Uy5qcGc',
                          width: 60,
                          height: 60,
                        );
                      },
                    ),
                    title: Text(
                      data.title ?? 'unknown',
                      style: const TextStyle(color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
