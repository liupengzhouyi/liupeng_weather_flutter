

import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/new/pageJump/pageJump.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Screen'),
      ),
      body: new Center(
        child: Row(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Launch new screen'),
              onPressed: () {
                // 页面跳转
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThirdScreen()));
              },
            ),
            new RaisedButton(
              child: new Text('Go back!'),
              onPressed: () {
                // 返回
                Navigator.pop(context);
              },
            ),
            new RaisedButton(
              child: new Text("改变颜色"),
              onPressed: () {Navigator.pushNamed(context, '/settingColor');},
            ),
          ],
        ),
      ),
    );
  }
}