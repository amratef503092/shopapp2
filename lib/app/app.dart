import 'package:flutter/material.dart';
class MyApp extends StatefulWidget {
  int appstate = 0;
  factory MyApp()=>instance;
  MyApp.internal();//privet  constructor
  static final instance =  MyApp.internal();



  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
