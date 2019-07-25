import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
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
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NumberPage(),
          settings: RouteSettings(
            arguments: PhoneNumber("${this.phoneName}", "123-123"),
          ),
        ),
    );
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

class NumberPage extends StatelessWidget {

  PhoneNumber phoneNumber = PhoneNumber("110", "123-123");

  @override
  Widget build(BuildContext context) {
    //  /*获取传递过来的参数*/
    phoneNumber = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Phone number'),
      ),
      //backgroundColor: Colors.grey,
      body: new Column(
        children: <Widget>[
          new Center(
            child: new Text(
              "${phoneNumber.phoneNumber}",
              style: new TextStyle(
                fontSize: 40.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class PhoneNumber {

  String _phoneNumber;

  String _dateTime;


  PhoneNumber(this._phoneNumber, this._dateTime);

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get dateTime => _dateTime;

  set dateTime(String value) {
    _dateTime = value;
  }

  @override
  String toString() {
    return 'PhoneNumber{_phoneNumber: $_phoneNumber, _dateTime: $_dateTime}';
  }
}
