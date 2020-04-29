import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:math';

class PostRideInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Post a Ride'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 0.78],
              colors: [Color(0xFF5C79FF), Color(0xFF81D4FA)]),
        ),
        child: CustomPaint(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 210,
                ),
                Center(
                    child: Column(
                  children: <Widget>[
                    Text('Hi'),
                  ],
                )),
              ],
            ),
          ),
          painter: ShapesPainter(),
        ),
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    var gradient = RadialGradient(
      colors: [
        Color(0xFF81D4FA),
        Color(0xFF5C79FF),
      ],
      stops: [0.6, 1],
    );

    paint.color = Colors.white.withOpacity(0.1);

    var path = Path();
    path.lineTo(0, size.height / 2);
    path.lineTo(size.width * 1.3, 0);
    path.close();
    canvas.drawPath(path, paint);

    paint.color = Colors.white.withOpacity(0.4);
    paint.shader = gradient.createShader(Offset.fromDirection(20, 20) & size);

    var position = Offset(size.width / 1.06, size.height / 2);
    canvas.drawCircle(position, 75.0, paint);

    paint.color = Colors.white.withOpacity(0.21);
    paint.shader = gradient.createShader(Offset.fromDirection(5, 20) & size);
    canvas.rotate(-0.8);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(-640, 530, 430, 112), Radius.circular(50)),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
