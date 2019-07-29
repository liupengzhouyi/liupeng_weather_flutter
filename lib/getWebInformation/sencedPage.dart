import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liupeng_weather_flutter/getWebInformation/post.dart';


Future<Post> fetchPost(String number) async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/' + "${number}");
  final responseJson = json.decode(response.body);
  return new Post.fromJson(responseJson);
}

class ShowPage extends StatelessWidget {
  String number;
  ShowPage({this.number});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

        title: new Text('Fetch Data Example'),
      ),
      body: new Center(
        child: new FutureBuilder<Post>(
          future: fetchPost(this.number),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}