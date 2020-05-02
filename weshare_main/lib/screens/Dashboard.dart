import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
        backgroundColor: Color(0xFFF1F3F5),
        appBar: AppBar(
          brightness: Brightness.light,
          automaticallyImplyLeading: false,
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
      ),
    );
  }
}