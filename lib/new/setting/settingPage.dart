
import 'package:flutter/material.dart';


class SettingSystemColors extends StatefulWidget{
  @override
  State createState() => new SettingSystemColorsState();
}

class SettingSystemColorsState extends State<SettingSystemColors> {

  void _setBlueColor() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new RaisedButton(
        child: new Text('blue'),
        onPressed: _setBlueColor,
      ),
    );
  }
}