
import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/talk/chatScreen.dart';

class TalkcasuallyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '会说你就多说点',
      home: new ChatScreen(),
    );
  }
}