
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
        newRow('1', '2', '3'),
        newRow('4', '5', '6'),
        newRow('7', '8', '9'),
        newRow('*', '0', '#'),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Icon(
                Icons.call,
                color: Colors.lightGreenAccent,
              ),
              onPressed: _push,
            ),
          ],
        ),
      ],
    );
  }

  newRow(String data1, String data2, String data3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        showRow(data1),
        showRow(data2),
        showRow(data3),
      ],
    );
  }

  showRow(String data) {
    return RaisedButton(
      child: new Text(data),
      onPressed: () {
        _addPhoneNumber(data);
      },
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
  String get dateTime => _dateTime;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  set dateTime(String value) {
    _dateTime = value;
  }

  @override
  String toString() {
    return 'PhoneNumber{_phoneNumber: $_phoneNumber, _dateTime: $_dateTime}';
  }
}
