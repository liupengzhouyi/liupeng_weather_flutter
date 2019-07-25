import 'package:flutter/material.dart';
import 'package:liupeng_weather_flutter/new/bottomNavigationBar/pages/book.dart';
import 'package:liupeng_weather_flutter/new/bottomNavigationBar/pages/home.dart';
import 'package:liupeng_weather_flutter/new/bottomNavigationBar/pages/movie.dart';
import 'package:liupeng_weather_flutter/new/bottomNavigationBar/pages/music.dart';
import 'package:liupeng_weather_flutter/new/pageJump/fristPage.dart';


class Homes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomesState();
  }
}

class _HomesState extends State<Homes> {

  int _currentIndex = 0;

  final List<Widget> _children = [Home(), Book(), Music(), Movie(), FirstScreen()];

  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      title: Text('Book'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.music_video),
      title: Text('Music'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.movie),
      title: Text('Movie'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.menu),
      title: new Text('其他'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Bottom Navigation'),),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: _list,
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}