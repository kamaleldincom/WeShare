import 'package:flutter/material.dart';
import 'dart:ui';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 70,
            ),
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              children: <Widget>[
                // Settings Header Components
                SizedBox(
                  width: 50,
                  child: FlatButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Settings',
                    style: Theme.of(context).appBarTheme.textTheme.title,
                  ),
                ),
                //! Buttons
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      //topLeft: Radius.circular(20.0),
                      //topRight: Radius.circular(20.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            color: Colors.blue,
                            size: 35,
                          ),
                          title: Text('My Profile',
                              style: Theme.of(context).textTheme.title),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.grey[300],
                          ),
                          onTap: () {},
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
