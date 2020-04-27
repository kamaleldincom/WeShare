import 'package:flutter/material.dart';

import 'constants.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyFlexiableAppBar extends StatelessWidget {

  final double appBarHeight = 250.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      decoration: new BoxDecoration(
        gradient: linearGradientvertical,
        // borderRadius: BorderRadius.vertical(bottom: Radius.circular(20,),),
      ),
      child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 100,
                width: 370,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                    
                      // padding: EdgeInsets.fromLTRB(65, 10, 65, 10),
                      onPressed: () {},
                      child: Text(
                        'Origin',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                        color: Colors.white,
                        thickness: 1.5,
                        indent: 10,
                        endIndent: 10,
                        height: 2,
                      ),
                    FlatButton(
                      // padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                      onPressed: () {},
                      child: Text(
                        'Destination',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),


              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.timer), 
                      iconSize: 26,
                      color: Colors.white.withOpacity(0.6),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.event_seat), 
                      iconSize: 26,
                      color: Colors.white.withOpacity(0.6),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list), 
                      iconSize: 26,
                      color: Colors.white.withOpacity(0.6),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
      
    );
  }
}