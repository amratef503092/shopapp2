import 'package:flutter/material.dart';
import 'package:shopapp22/app/app.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  void updatestate(){
    MyApp.instance.appstate = 10;
  }
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
