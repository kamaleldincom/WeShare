import 'package:flutter/material.dart';
import 'package:weshare_main/screens/authentication/Login.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
     name:'assets/splash.flr',
      next: (_) => Login(),
      until: () => Future.delayed(Duration(seconds: 1)),
      loopAnimation: '2', 
    );
    
  }
}
