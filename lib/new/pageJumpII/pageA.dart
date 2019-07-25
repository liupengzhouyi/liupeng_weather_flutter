
import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Page one'),
        leading: new InkWell(
          //onTap: () {Navigator.pop(context);},
          child: new Icon(Icons.home),
        ),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/b');
          },
          child: new Text(
            '下一页',
            style: new TextStyle(color: Colors.deepOrange),
          ),
        ),
      ),
    );
  }
}