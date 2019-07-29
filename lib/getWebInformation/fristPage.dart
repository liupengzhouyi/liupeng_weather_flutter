
import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/getWebInformation/sencedPage.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new FristPage(),
    ),
  );
}

class FristPage extends StatefulWidget {
  @override
  State createState() {
    return new _FristPages();
  }
}

class _FristPages extends State<FristPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(icon: new Icon(Icons.home), onPressed: null),
        title: new Text('获取网络数据'),
      ),
      body: new GetLiupengListView(),
    );
  }
}

class LiupengListView extends StatelessWidget {
  int number;
  LiupengListView({this.number});
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.storage,
          color: Colors.grey,
        ),
        new Text('${this.number}'),
        new RaisedButton(
          child: new Icon(
            Icons.arrow_forward_ios,
            color: Colors.red,
          ),
          onPressed: () {
            // print('${number}');
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new ShowPage(number:'${number}')),);
          }
        )
      ],
    );
  }
}

class GetLiupengListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    for (int i=0;i<20;i++) {
      LiupengListView liupengListView = new LiupengListView(number: i,);
      _list.add(liupengListView);
    }
    return new ListView(
      children: _list,
    );
  }
}


