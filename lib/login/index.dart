import 'package:flutter/material.dart';

import '../flutterStudio.dart';

void main() {
  runApp(
    new MaterialApp(
      title: '登录',
      home: new LiupengLogin(),
    ),
  );
}

class LiupengLogin extends StatefulWidget {
  @override
  State createState() {
    return new _LiupengLogin();
  }
}

class _LiupengLogin extends State<LiupengLogin> {

  TextEditingController _textEditingControllerInputUserID = new TextEditingController();

  TextEditingController _textEditingControllerInputUserPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Center(
              child: new Image.asset('images/loginImage.png'),
            ),
            height: 240.0,
          ),
          new Column(
            children: <Widget>[
              new Container(
                width: 360.0,
                child: new TextFormField(
                  // 自动获取焦点
                  autofocus: true,
                  // 输入的内容在水平方向如何显示
                  textAlign: TextAlign.center,
                  // 绑定输入控制器
                  controller: this._textEditingControllerInputUserID,
                  //
                  decoration: InputDecoration(
                    labelText: '账号',
                    hintText: "请输入你的账号",
                    icon: new Icon(Icons.account_circle),
                    border: new OutlineInputBorder(),
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
              ),
              new Container(
                width: 360.0,
                child: new TextFormField(
                  // 自动获取焦点
                  autofocus: true,
                  // 输入的内容在水平方向如何显示
                  textAlign: TextAlign.center,
                  // 绑定输入控制器
                  controller: this._textEditingControllerInputUserPassword,
                  // 是否隐藏输入的内容
                  obscureText: true,
                  //
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: "请输入你的密码",
                    icon: new Icon(Icons.vpn_key),
                    border: new OutlineInputBorder(),
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "请填写密码";
                  },
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: new Text('登录'),
                    textColor: Colors.black,
                    onPressed: () {
                      String name = this._textEditingControllerInputUserID.text;
                      print(name);
                    },
                  ),
                  new RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: new Text('登录'),
                    textColor: Colors.black,
                    onPressed: () {
                      String password = this._textEditingControllerInputUserPassword.text;
                      print(password);
                      if (this._textEditingControllerInputUserID.text == "liupeng") {
                        if (this._textEditingControllerInputUserPassword.text == "123456") {
                          Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new MyApp()));
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
