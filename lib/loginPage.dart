import 'package:flutter/material.dart';

/**
 * 返回一个类
 */
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

/**
 * 核心版面
 */
class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  //创建动画控制器 和动画 （动画用于控制log）
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //创建具体的动画控制器和动画
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: 1000
        )
    );
    _animation = new CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut
    );
    //为动画添加监听事件
    _animation.addListener(() => this.setState(() {}));
    //执行动画
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigoAccent,
      body: Container(
        child: Stack(
          //堆叠布局
          fit: StackFit.expand,
          children: <Widget>[
            Image(
                image: AssetImage("images/109.jpg"),
                fit: BoxFit.fill,
                color: Colors.black87,
                colorBlendMode: BlendMode.darken
            ),
            Theme(
              data: ThemeData(
                  brightness: Brightness.dark,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(color: Colors.teal, fontSize: 20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(
                    size: _animation.value * 100,
                  ),
                  Container(
                    //内部为垂直布局 其中添加TextField和button
                      child: Column(
                        children: <Widget>[
                          // 用户信息输入框
                          TextFormField(
                            decoration: InputDecoration(labelText: "Enter the Email"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Padding(padding: EdgeInsets.only(top: 30)),
                          // 密码输入框
                          TextFormField(
                            decoration: InputDecoration(labelText: "Enter the password"),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          // 按钮
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: Text("Login"),
                            splashColor: Colors.blueAccent,
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
