
import 'package:api/services/api_services.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Api'),
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
              return Card(
                child: ListTile(
                  leading:
                      Image(image: NetworkImage(snapshot.data![index].img)),
                  title: Text(
                    snapshot.data![index].name,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
