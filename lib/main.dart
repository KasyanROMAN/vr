import 'package:flutter/material.dart';
import 'package:vrg_rebbit/pages/post_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data',
      debugShowCheckedModeBanner: false,
      home: PostPage(),
      routes: {
        "PostsPage": (BuildContext context) => PostPage(),
      },
    );
  }
}
