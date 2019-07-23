
import 'package:flutter/material.dart';

const String _name = "hekaiyou";

class ChatMessage extends StatelessWidget {
  // 构造函数
  ChatMessage({this.text});
  // 成员变量
  final String text;
  // 复写的方法
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      // 返回一个Row控件
      child: new Row(
        // Row控件: CrossAxisAlignment.start会沿垂直轴给出最高位置。
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 显示一个简单的图形头像
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(
                _name[0]
              ),
            ),
          ),
          // 包含发件人姓名的Column控件和消息的文本
          new Column(
            // Column控件 : CrossAxisAlignment.start将沿着水平轴的最左侧位置的文本对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 发件人姓名
              new Text(
                _name,
                // textTheme属性可以让我们访问质感设计逻辑样式，
                // 比如文字像subhead，因此您可以避免硬编码字体大小和其他文本属性。
                style: Theme.of(context).textTheme.subhead,
              ),
              // 消息的文本
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              ),
            ],
          )
        ],
      ),
    );
  }


}