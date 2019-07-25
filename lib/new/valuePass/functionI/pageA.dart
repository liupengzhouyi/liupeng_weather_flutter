import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/new/valuePass/functionI/pageB.dart';


class PageIIA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A页面"),
        leading: InkWell(
          //onTap: () {Navigator.pop(context);},
          child: Icon(Icons.home,),
        ),
      ),
      body: Center(
        child: new IconButton(
            icon: new Icon(Icons.forward),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageIIB(data: 'DataII',),
                  ),
              );
            },
        ),
      ),
    );
  }
}

