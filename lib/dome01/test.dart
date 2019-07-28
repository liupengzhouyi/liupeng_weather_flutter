
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    return textSection;
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
          new Image.asset(
            'images/loginImage.png',
            height: 240.0,
            fit: BoxFit.cover,
          ),
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
          new MyApp(),
        ],
      ),
    );
  }
}