import 'package:flutter/material.dart';
import 'package:weshare_main/weshare_icons.dart';

import 'constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F5),
      appBar: AppBar(
      backgroundColor: Color(0xFFF1F3F5),
        title: Text(
          'WeShare',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),  
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          
        ],
        
      ),
      body: Container(),
      // bottomNavigationBar: BtmNavBar(),
    );
  }
}