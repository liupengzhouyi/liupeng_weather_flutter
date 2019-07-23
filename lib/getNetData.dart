import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter获取网络数据',
      home: new PalyView(),
    ),
  );
}


class PalyView extends StatefulWidget {

  PalyView({Key key, this.title}):super(key: key);

  final String title;

  @override
  State createState() {
    return new _Paly();
  }
}


class _Paly extends State<PalyView> {

  String url = "https://www.tianqiapi.com/api/?version=v1&cityid=101080201";

  String str;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  // 获取网络数据
  void _getData() async {
    http.get(url).then((http.Response response) {
      var date = json.decode(response.body);
      this.str = date['city'];
      //当你调用 setState()， 将合并你提供的对象到当前的状态中
      this.setState((){});
    });
  }

  AppBar _appBarView() {
    return AppBar(
      title: new Text(
          "${this.str}"
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarView(),
    );
  }
}

