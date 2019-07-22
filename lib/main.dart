import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '天气',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '天气'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 构造函数
  Weather weather = new Weather();
  // 设置文字颜色
  Color textColor = Colors.white;
  // 成员变量：
  Color containerColor = Colors.black38;
  // 成员变量： 网址
  String url = "https://www.tianqiapi.com/api/?version=v1&cityid=101080201";
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    http.get(url).then((http.Response response) {
      var jsonData = json.decode(response.body);
      weather.cityName = jsonData["city"];
      weather.updateTime = jsonData["update_time"];
      List data = new List();
      data = jsonData["data"];
      for (int i = 0; i < data.length; i++) {
        DataBean dataBean = new DataBean();
        dataBean.air = data[i]["air"];
        dataBean.airLevel = data[i]["air_level"];
        dataBean.airTips = data[i]["air_tips"];
        dataBean.day = data[i]["day"];
        dataBean.week = data[i]["week"];
        dataBean.tem = data[i]["tem"];
        dataBean.tem1 = data[i]["tem1"];
        dataBean.tem2 = data[i]["tem2"];
        dataBean.wea = data[i]["wea"];
        weather.dataBean.add(dataBean);
      }
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weather.dataBean.length == 0
          ? _loading(context)
          : Stack(
        children: <Widget>[
          Image.network(
            "http://pic.netbian.com/uploads/allimg/190510/221228-15574975489aa1.jpg",
            fit: BoxFit.fill,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: body(),
          )
        ],
      ),
    );
  }

  Widget body() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text("${weather.cityName}"),
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                child: Text(
                  DateTime.now().hour.toString() +
                      ":" +
                      DateTime.now().minute.toString(),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          topView(),
          centerView(),
          bottomView(),
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: Text(
              "API来源为：https://www.tianqiapi.com",
              style: TextStyle(color: textColor),
            ),
          )
        ],
      ),
    );
  }

  Widget topView() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      color: containerColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              weather.dataBean[0].tem,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: textColor,
              )),
          Text(
            weather.dataBean[0].wea,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }

  Widget centerView() {
    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: textColor,
    );
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      color: containerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("空气质量",
              style: textStyle
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("${weather.dataBean[0].air}",
                  style: textStyle
              ),
              Text(
                "${weather.dataBean[0].airLevel}",
                style: textStyle,
              )
            ],
          ),
          Text(
            "${weather.dataBean[0].airTips}",
            style: TextStyle(color: textColor),
          )
        ],
      ),
    );
  }

  Widget bottomView() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      color: containerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("预报",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: textColor,
              )),
          Column(
            children: _listView(),
          )
        ],
      ),
    );
  }

  List<Widget> _listView() {
    List<Widget> widgets = new List();
    for (int i = 0; i < weather.dataBean.length; i++) {
      widgets.add(itemView(weather.dataBean[i]));
    }
    return widgets;
  }

  Widget itemView(DataBean data) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("${data.day}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              )),
          Text(
            "${data.wea}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "${data.tem1}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                "/",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                "${data.tem2}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _loading(context) {
    return new Center(
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 5.0,
            ),
            new Container(
              margin: EdgeInsets.only(top: 10.0),
              child: new Text(
                "正在加载..",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ]),
    );
  }
}
