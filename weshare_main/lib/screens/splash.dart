import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/screens/authentication/Login.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:weshare_main/wrapper.dart';

import 'constants.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {

    // final user = Provider.of<User>(context);
    // print(user);
    // return either home or authenticate widget
    return SplashScreen.navigate(
     name:'assets/splash.flr',
      // next: (_) =>  user == null ?Login() :BtmNavBar(),
      next: (_) =>  Wrapper(),
      until: () => Future.delayed(Duration(seconds: 1)),
      loopAnimation: '2', 
    );
    
  }
}
