import 'package:demo_bloc/test1/todoscreen.dart';
import 'package:demo_bloc/test3/test3.dart';
import 'package:demo_bloc/test4/counter/test4.dart';
import 'package:demo_bloc/test5/test5.dart';
import 'package:demo_bloc/test6/test6.dart';
import 'package:demo_bloc/testloadmore/test_load_more.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: TestLoadMore(),
    );
  }
}
