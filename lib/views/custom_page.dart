import 'package:flutter/material.dart';

class CustomPages extends StatefulWidget {
  final String img;
  final String title;
  const CustomPages({super.key, required this.img, required this.title});

  @override
  State<CustomPages> createState() => _CustomPagesState();
}

class _CustomPagesState extends State<CustomPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage(widget.img)),
          Text(widget.title),
        ],
      ),
    );
  }
}
