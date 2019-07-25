import 'package:flutter/material.dart';

class Movie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Movie'),),
      backgroundColor: Colors.lightGreenAccent,
      body: new Text('Movie'),
    );
  }
}