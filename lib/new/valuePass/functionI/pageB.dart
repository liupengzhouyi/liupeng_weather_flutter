import 'package:flutter/material.dart';

class PageIIB extends StatelessWidget {
  String data;
  PageIIB({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B页面"),
        leading: InkWell(
          onTap: () {Navigator.pop(context);},
          child: Icon(Icons.arrow_back,),
        ),
      ),
      body: Center(child: Text(data),),
    );
  }
}

