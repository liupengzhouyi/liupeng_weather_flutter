


import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/login/index.dart';

class ShowBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Background Image'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/109.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new TextFormField(
              controller: new TextEditingController(),
            )
          ],
        ),
      ),
    );
  }
}

class LiupengColume extends StatefulWidget {
  @override
  State createState() {
    return new _LiupengColume();
  }
}

class _LiupengColume extends State<LiupengColume> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text('背景图片'),
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new RaisedButton(
                child: new Text('提交',),
                onPressed: () {
                  print('Hello World');
                },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter Background Image',
      home: new ShowBackgroundImage(),
      // home: new LiupengColume(),
    ),
  );
}