import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/new/valuePass/functionII/phoneNumber.dart';


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