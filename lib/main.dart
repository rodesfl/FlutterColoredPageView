import 'package:flutter/material.dart';
import 'package:fluttercoloredpageview/colored.pageview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Flutter Colored Pageview'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ColoredPageView(
        [
          Center(
            child: Text("Page One"),
          ),
          Center(
            child: Text("Page Two"),
          ),
          Center(
            child: Text("Page Three"),
          ),
        ],
        [
          Colors.yellowAccent,
          Colors.purpleAccent,
          Colors.greenAccent,
        ],
      ),
    );
  }
}
