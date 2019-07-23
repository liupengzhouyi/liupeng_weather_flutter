import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:liupeng_weather_flutter/weather/weather.dart';
import 'package:flutter/material.dart';

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
  // 复写初始化函数
  @override
  void initState() {
    super.initState();
    getData();
  }

  //获取数据
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
      body: weather.dataBean.length == 0 ? _loading(context) : Stack(
        children: <Widget>[
          // 背景图片
          Image.network(
            "http://pic.netbian.com/uploads/allimg/190510/221228-15574975489aa1.jpg",
            fit: BoxFit.fill,
            height: double.infinity,
          ),
          //页面-单子滚动视图
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
          appBarView(),
          topView(),
          centerView(),
          bottomView(),
          paddingView(),
        ],
      ),
    );
  }

  AppBar appBarView() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text("${weather.cityName}"),
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          child: Text(
            DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString(),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  Widget paddingView() {
    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 10),
      child: Text(
        "API来源为：https://www.tianqiapi.com",
        style: TextStyle(color: textColor),
      ),
    );
  }

  Widget topView() {
    return Container(
      // 填充 ：
      padding: EdgeInsets.all(10),
      // 边缘 ：
      margin: EdgeInsets.all(10),
      color: containerColor,
      child: Row(
        // 设置主轴对齐
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              weather.dataBean[0].tem,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: textColor,
              ),
          ),
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
    // 设置文字样式
    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: textColor,
    );
    return Container(
      // 填充 ：
      padding: EdgeInsets.all(10),
      // 边缘 ：
      margin: EdgeInsets.all(10),
      // 颜色 ：
      color: containerColor,
      child: Column(
        // 横轴对齐 : 横轴对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "空气质量",
              style: textStyle
          ),
          Row(
            //主轴对齐 : 主轴对齐.空间围绕
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
      // 填充 ：
      padding: EdgeInsets.all(10),
      // 边缘 ：
      margin: EdgeInsets.all(10),
      // 颜色 ：
      color: containerColor,
      // 子元素： 列
      child: Column(
        // 横轴对齐 ：横轴对齐.启动,
        crossAxisAlignment: CrossAxisAlignment.start,
        // 子元素们：
        children: <Widget>[
          Text(
            "预报",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: textColor,
            )),
          // 列
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
          //时间
          Text("${data.day}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              )),
          // 天气状况
          Text(
            "${data.wea}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          // 最高/最低温度
          Row(
            children: <Widget>[
              // 最高温度
              Text(
                "${data.tem1}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              // /
              Text(
                "/",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              // 最低温度
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
