
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopapp22/presentation/resources/assets_manager.dart';
import 'package:shopapp22/presentation/resources/color_manager.dart';
import 'package:shopapp22/presentation/resources/route_manager.dart';
class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  Timer?_timer;
  _startDelay(){
    _timer = Timer( const Duration(
        seconds: 2
    ),
        _goNext

    );
  }
  _goNext(){
    Navigator.pushReplacementNamed(context , Routes.onBoardingRoute);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
