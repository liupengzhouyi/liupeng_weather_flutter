import 'package:flutter/material.dart';

class Book extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Book'),),
      backgroundColor: Colors.lightGreenAccent,
      body: new Text('Book'),
    );
  }
}