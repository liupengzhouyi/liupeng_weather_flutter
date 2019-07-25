import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Home'),),
      backgroundColor: Colors.lightGreenAccent,
      body: new Text('Home'),
    );
  }
}

