
import 'package:flutter/material.dart';

// V 2.1.0


//在Flutter中，如果要在窗口控件中可视化呈现状态数据，
// 则应将此数据封装在State对象中。
// 然后，您可以将State对象与扩展StatefulWidget类的窗口控件ChatScreen相关联。

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {

  // Flutter框架提供了一个名为TextField的质感设计控件，
  // ，具有用于自定义输入字段行为的属性。
  // 作为该项目的第一个有状态控件，它需要一些修改才能管理内部状态更改。

  //要管理与文本字段的交互，需要使用TextEditingController对象。
  // 您将使用它来读取输入字段的内容，并在发送消息后清除该字段。
  final TextEditingController _textEditingController = new TextEditingController();

  // 要在用户提交消息时通知，
  // 需要使用onSubmitted参数提供一个私有回调方法_handleSubmitted()。
  void _handleSubmitted(String text) {
    // 清除该字段
    this._textEditingController.clear();
  }

  // 定义一个名为_buildTextComposer()的私有方法，
  // 使用已配置的TextField控件返回Container控件。
  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      // 添加一个行控件
      child: new Row(
        // ___输入框___ (发送按钮)
        children: <Widget>[
          // 将TextField控件包装在Flexible控件中，
          // 这将使Row自动将文本字段的大小用于使用按钮未使用的剩余空间。
          new Flexible(
            // 子控件：输入框
            child: new TextField(
              // 控制器
              controller: _textEditingController,
              // 提交消息时通知，需要使用onSubmitted的回调方法
              onSubmitted: _handleSubmitted,
              // 显示的字段
              decoration: new InputDecoration.collapsed(
                hintText: '发送消息',
              ),
            ),
          ),
          // 按钮
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            // 按钮子控件
            child: new IconButton(
              // 图标
              icon: new Icon(Icons.send),
              // 回调函数
              onPressed: () => this._handleSubmitted(this._textEditingController.text),
            ),
          )
        ],
      ),
    );
  }

  //build()方法应该包括以前在控件树的ChatScreen部分中的所有窗口控件。
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '会说你就多说点'
        ),
      ),
      // 告诉应用程序如何显示文本输入控件
      body: this._buildTextComposer(),
    );
  }
}






// V 2.1.0 版本
/*class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '会说你就多说点'
        ),
      ),
    );
  }
}*/


