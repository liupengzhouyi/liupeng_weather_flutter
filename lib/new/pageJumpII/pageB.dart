
import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Page tow'),
        leading: new InkWell(
          onTap: () {Navigator.pop(context);},
          child: new Icon(Icons.arrow_back),
        ),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: new Text(
            '返回上一页',
            style: new TextStyle(color: Colors.deepOrange),
          ),
        ),
      ),
    );
  }
}