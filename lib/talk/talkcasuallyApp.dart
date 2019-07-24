
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/talk/chatScreen.dart';
import 'package:liupeng_weather_flutter/talk/theme.dart';

class TalkcasuallyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '会说你就多说点',
      theme: defaultTargetPlatform == TargetPlatform.iOS
        ? kIOSTheme
        : kDefaultTheme,
      home: new ChatScreen(),
    );
  }
}