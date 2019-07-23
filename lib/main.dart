import 'package:flutter/material.dart';

// main.dart文件位于Flutter项目中的lib目录下，并包含启动执行应用程序的main()函数。

// main()和runApp()

void main() {
  // runApp()函数作为参数，它是一个Widget，
  // Flutter框架在运行时展开并显示在应用程序的屏幕上。

  runApp(
    // 由于应用程序在UI中使用质感设计元素，
    // 因此创建一个新的MaterialApp对象并将其传递给runApp()函数，
    // 这个控件是我们应用程序控件树的根。
    new MaterialApp(
      title: '会说你就多说点',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('会说你就多说点儿'),
        ),
      ),
    ),
  );
}