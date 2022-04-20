import 'package:example/home_page.dart';
import 'package:example/scroll_behaviour.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: CustomScrollBehavior(),
      home: HomePage(),
    );
  }
}
