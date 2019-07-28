
import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new Deom(),
    ),
  );
}

class DomeFather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("123"),
      ),
      body: new Dome(),
    );
  }
}

class Dome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),

      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    return titleSection;
  }
}

class Deom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Test'),
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.call,
                    color: Colors.blue,
                  ),
                  new Text(
                    "CALL",
                    style: new TextStyle(
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                  new Text(
                    "SEND",
                    style: new TextStyle(
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.share,
                    color: Colors.blue,
                  ),
                  new Text(
                    "SHARE",
                    style: new TextStyle(
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ],
          ),
          new Dome(),
        ],
      ),
    );
  }
}