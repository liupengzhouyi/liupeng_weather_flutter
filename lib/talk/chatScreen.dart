
import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/talk/chatMassage.dart';

// V 2.1.0

//在Flutter中，如果要在窗口控件中可视化呈现状态数据，
// 则应将此数据封装在State对象中。
// 然后，您可以将State对象与扩展StatefulWidget类的窗口控件ChatScreen相关联。

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}




class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

  //要管理与文本字段的交互，需要使用TextEditingController对象。
  // 您将使用它来读取输入字段的内容，并在发送消息后清除该字段。
  final TextEditingController _textEditingController = new TextEditingController();

  // 在我们的ChatScreenState控件定义中，添加名为_messages的List成员来表示每个聊天消息。
  // 每个列表项都是一个ChatMessage实例，而且需要将消息列表初始化为空列表。
  final List<ChatMessage> _messages = <ChatMessage>[];

  // 定义_isComposing，一个私有成员变量，只要用户在输入字段中键入，该变量就是true。
  bool _isComposing = false;



  // 要在用户提交消息时通知，
  // 需要使用onSubmitted参数提供一个私有回调方法_handleSubmitted()。
  // 在当前用户从文本字段发送消息时，我们的应用程序应该将新消息添加到消息列表中。
  // 实例化一个AnimationController对象并将动画的运行时间指定为700毫秒
 /* void _handleSubmitted(String text) {
    // 清除该字段
    this._textEditingController.clear();
    ChatMessage chatMessage = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(
          // 动画的运行时间指定为700毫秒
          milliseconds: 700
        ),
      ),
    );
    //您调用setState()来修改_messages并让框架知道这部分控件树已经更改，并且需要重建UI。
    // 在setState()中只能执行同步操作，否则框架可能在操作完成之前重新构建窗口控件。
    setState(() {
      _messages.insert(0, chatMessage);
    });
    //
    chatMessage.animationController.forward();
  }*/
  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      // 当文本字段被清除时，修改_handleSubmitted将_isComposing更新为false。
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
        text: text,
        animationController: new AnimationController(
            duration: new Duration(milliseconds: 700),
            // 想要将我们的ChatScreenState作为vsync，
            // 需要在ChatScreenState类定义中包含一个TickerProviderStateMixin。
            vsync: this
        )
    );
    setState((){
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }



  // 定义一个名为_buildTextComposer()的私有方法，
  // 使用已配置的TextField控件返回Container控件。
  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(
          // _buildTextComposer()方法可以从其封装State对象访问BuildContext对象，
          // 您不需要明确地将上下文传递给该方法。
          color: Theme.of(context).accentColor,
        ),
        child: new Container(
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
                  // 文本输入框的回调函数
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
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
                  onPressed: _isComposing ? () => _handleSubmitted(_textEditingController.text) : null
                ),
              )
            ],
          ),
        )
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
      // 垂直布置其直接的子控件列表（children）。
      // Column可以占用多个子窗口控件，这是包括一个滚动列表和一个输入字段的行。
      body: new Column(
        children: <Widget>[
          // 作为ListView的父级。
          // 这告诉框架让接收到消息的列表展开以填充Column高度，而TextField保持固定的大小。
          new Flexible(
            // 为消息列表添加一个ListView窗口控件, 我们选择ListView.builder构造函数，
            // 因为默认构造函数不会自动检测其children的突然变化。
            child: new ListView.builder(
              // padding对于消息文本周围的空白
              padding: new EdgeInsets.all(8.0),
              // reverse使ListView从屏幕底部开始
              reverse: true,
              // itemBuilder对于在[index]中构建每个窗口控件的函数。
              // 因为我们不需要当前的构建上下文，
              // 所以我们可以忽略IndexedWidgetBuilder的第一个参数。
              // 命名参数_（下划线）是一个表示不会被使用的约定。
              itemBuilder: (_, int index) => _messages[index],
              // itemCount指定列表中的消息数
              itemCount: _messages.length,
            ),
          ),
          // 在用于显示消息的UI和用于撰写消息的文本输入字段之间绘制水平的横线。
          new Divider(
            height: 1.0,
          ),
          // 作为文本编辑区的父级，
          // 可用于定义背景图像、填充、边距和其他常见布局细节。
          new Container(
            // 创建一个定义背景颜色的新BoxDecoration对象。
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      )
    );
  }

  // 通过在ChatScreenState中覆盖dispose()方法
  // 不再需要资源时释放资源
  @override
  void dispose() {
    for (ChatMessage chatMessage in _messages) {
      chatMessage.animationController.dispose();
    }
    super.dispose();
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


