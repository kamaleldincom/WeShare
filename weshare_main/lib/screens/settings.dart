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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
