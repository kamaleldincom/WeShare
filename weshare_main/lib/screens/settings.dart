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
                        SettingsButtons(
                            Icons.account_circle, 'My Profile', true, () {}),
                        SettingsButtons(
                            Icons.lock, 'Privacy Policy', true, () {}),
                        SettingsButtons(
                            Icons.help, 'Help & Support', true, () {}),
                        SettingsButtons(
                            Icons.insert_comment, 'Feedback', false, () {}),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: FlatButton(
          child: Text(
            'Log Out',
            style: TextStyle(
                // fontFamily: 'SegoeUI',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          onPressed: () {},
          color: Colors.grey[500],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(horizontal: 149, vertical: 12),
        ),
      ),
    );
  }
}

class SettingsButtons extends StatelessWidget {
  final icon;
  final title;
  final bool isPageNavigator;
  final Function handler;

  SettingsButtons(this.icon, this.title, this.isPageNavigator, this.handler);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 35,
        ),
        title: Text(title, style: Theme.of(context).textTheme.title),
        trailing: isPageNavigator
            ? Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey[300],
              )
            : null,
        onTap: handler,
      ),
      Divider(
        thickness: 1,
        color: Colors.grey[300],
        height: 1,
      ),
    ]);
  }
}
