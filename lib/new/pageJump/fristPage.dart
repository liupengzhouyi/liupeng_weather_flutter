
import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/new/pageJump/secondPage.dart';


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FirstPAge'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back
          ),
        ),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Launch new screen'),
            onPressed: () {
              Navigator.push(
                context,
                // 页面跳转
                new MaterialPageRoute(builder: (context) => new SecondScreen()),
              );
            }
        ),
      ),
    );
  }
}