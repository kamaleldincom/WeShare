import 'package:flutter/material.dart';
import 'package:weshare_main/weshare_icons.dart';

import 'constants.dart';

class Rides extends StatefulWidget {
  @override
  _RidesState createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F5),
      appBar: AppBar(
      backgroundColor: Color(0xFFF1F3F5),
        title: Text(
          'Rides',
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
      body: Column(
          children: <Widget>[
            Container(
            height: 60,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: <Color>[
              Color(0xFF9ADAFC),
              Color(0xFF8496FD)
              ])
            ),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(55, 10,55,10),
                      onPressed: (){},
                      child: Text(
                        'Current',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF5C79FF),
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(7.0),
                        ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.fromLTRB(45, 10,45,10),
                      onPressed: (){},
                      child: Text(
                        'History',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),)
                  ]
                ),
          ),
          ],
        ),
      // bottomNavigationBar: BtmNavBar(),
    );
  }
}