import 'package:flutter/material.dart';

import 'bar/navigationBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      home: Homes(),
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}





