import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/new/route/routes.dart';
import 'package:liupeng_weather_flutter/new/valuePass/functionII/phoneNumber.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: RoutePath,
      home: PhonePage(),
    );
  }
}

class PhonePage extends StatefulWidget {
  @override
  State createState() {
    return new PhonePageState();
  }
}

class PhonePageState extends State<PhonePage> {

  String phoneName = "";

  Widget getMainIntorface() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
            "${this.phoneName}",
            style: new TextStyle(
              fontSize: 40.0,
              color: Colors.black,
              fontFamily: "Courier",
            ),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(child: new Text('1'), onPressed: () {_addPhoneNumber('1');},),
            new RaisedButton(child: new Text('2'), onPressed: () {_addPhoneNumber('2');},),
            new RaisedButton(child: new Text('3'), onPressed: () {_addPhoneNumber('3');},),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(child: new Text('4'), onPressed: () {_addPhoneNumber('4');},),
            new RaisedButton(child: new Text('5'), onPressed: () {_addPhoneNumber('5');},),
            new RaisedButton(child: new Text('6'), onPressed: () {_addPhoneNumber('6');},),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(child: new Text('7'), onPressed: () {_addPhoneNumber('7');},),
            new RaisedButton(child: new Text('8'), onPressed: () {_addPhoneNumber('8');},),
            new RaisedButton(child: new Text('9'), onPressed: () {_addPhoneNumber('9');},),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(child: new Text('*'), onPressed: () {_addPhoneNumber('*');},),
            new RaisedButton(child: new Text('0'), onPressed: () {_addPhoneNumber('0');},),
            new RaisedButton(child: new Text('#'), onPressed: () {_addPhoneNumber('#');},),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Icon(Icons.call, color: Colors.lightGreenAccent,),
              onPressed: _push,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: getMainIntorface(),
    );
  }

  void _push() {
    Navigator.of(context).pushNamed('/numberPage', arguments: PhoneNumber("${this.phoneName}", "123-123"));
    this._clearPhoneNumber();
  }

  void _clearPhoneNumber() {
    setState(() {
      this.phoneName = "";
    });
  }

  _addPhoneNumber(String number) {
    setState(() {
      this.phoneName = this.phoneName + number;
    });
  }
}

/*
void _addPhoneNumber1() {
    setState(() {
      this.phoneName = this.phoneName + '1';
    });
  }

  void _addPhoneNumber2() {
    setState(() {
      this.phoneName = this.phoneName + '2';
    });
  }

  void _addPhoneNumber3() {
    setState(() {
      this.phoneName = this.phoneName + '3';
    });
  }

  void _addPhoneNumber4() {
    setState(() {
      this.phoneName = this.phoneName + '4';
    });
  }

  void _addPhoneNumber5() {
    setState(() {
      this.phoneName = this.phoneName + '5';
    });
  }

  void _addPhoneNumber6() {
    setState(() {
      this.phoneName = this.phoneName + '6';
    });
  }

  void _addPhoneNumber7() {
    setState(() {
      this.phoneName = this.phoneName + '7';
    });
  }

  void _addPhoneNumber8() {
    setState(() {
      this.phoneName = this.phoneName + '8';
    });
  }

  void _addPhoneNumber9() {
    setState(() {
      this.phoneName = this.phoneName + '9';
    });
  }

  void _addPhoneNumber0() {
    setState(() {
      this.phoneName = this.phoneName + '0';
    });
  }

  void _addPhoneNumber_() {
    setState(() {
      this.phoneName = this.phoneName + '*';
    });
  }

  void _addPhoneNumber__() {
    setState(() {
      this.phoneName = this.phoneName + '#';
    });
  }
 */
