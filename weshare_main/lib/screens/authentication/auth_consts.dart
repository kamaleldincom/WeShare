import 'package:flutter/material.dart';

Column bottomSection(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        // 'Forgot Password?',
        text,
        style: TextStyle(color: Colors.blue, fontSize: 14.0),
      ),
      Divider(),
      Text('Or Sign-up using ',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.grey, fontSize: 18.0)),
      SizedBox(height: 40),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('assets/icon-google.png'),
          Image.asset('assets/icon-facebook.png'),
        ],
      ),
      SizedBox(height: 150,),
    ],
  );
}
