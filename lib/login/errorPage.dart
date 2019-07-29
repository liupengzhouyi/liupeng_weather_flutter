
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new ErrorPage(),));
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('登录错误'),
      ),
      body: new Center(
        child: new Text('你这个一看就是错误的'),
      ),
    );
  }
}

