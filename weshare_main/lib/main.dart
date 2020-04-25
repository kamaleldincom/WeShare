import 'package:flutter/material.dart';
import 'package:weshare_main/screens/Dashboard.dart';
import 'package:weshare_main/screens/Notifications.dart';
import 'package:weshare_main/screens/Profile.dart';
import 'package:weshare_main/screens/Rides.dart';
import 'package:weshare_main/screens/authentication/Login.dart';
import 'package:weshare_main/screens/constants.dart';
import 'package:weshare_main/screens/splash.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:weshare_main/screens/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: 'SegoeUI',
        textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
              //   fontFamily: 'SegoeUI',
              fontSize: 16,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  //  fontFamily: 'SegoeUI',
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Settings(),
      initialRoute: '/splash',
      routes: {
        // '/': (context) => Loading(),
        // '/home': (context) => Home(),
        '/settings': (context) => Settings(),
        '/login': (context) => Login(),
        '/splash': (context) => Splash(),
        '/profile': (context) => Profile(),
        '/notifications': (context) => Notifications(),
        '/rides': (context) => Rides(),
        '/dashboard': (context) => Dashboard(),
        '/nav': (context) => BtmNavBar(),
      },
    );
  }
}
