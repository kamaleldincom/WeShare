import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget {

  // final double barHeight = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'WeShare',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}