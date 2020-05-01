import 'package:flutter/material.dart';
import '../weshare_icons.dart';
import 'Dashboard.dart';
import 'Notifications.dart';
import 'Profile.dart';
import 'Rides.dart';
// import 'authentication/newRides.dart';

/* 
  this file is for components that are going to be used in multiple pages
  e.g. buttons and input fields decoratoin
  */

const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.white, width: 2.0)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Colors.blue, width: 0.5),
      // borderRadius: BorderRadius.circular( 20.0),
    ));

    

Ink buttonWithGradient(String text) {
  //assignto a child insid any button and pass the text ypu like
  return Ink(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xFF76D3FF), Color(0xFF5C79FF)]),
        borderRadius: BorderRadius.circular(10.0)),
    child: Container(
      constraints: BoxConstraints(maxWidth: 310.0, minHeight: 60.0),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}



class BtmNavBar extends StatefulWidget {
  @override
  _BtmNavBarState createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  int _currentIndex = 2;
  final List<Widget> _pages = [
    Dashboard(),
    Rides(),
    Notifications(),
    Profile(),
  ];
  // void onTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            _currentIndex = index;
            setState(() {});
          },
          // onTap: onTapped,
          type: BottomNavigationBarType.fixed,
          iconSize: 26,
          selectedFontSize: 12,
          unselectedItemColor: Colors.black26,
          selectedItemColor: Color(0xFF5C79FF),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.view_agenda,
              ),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              title: Text(
                'Rides',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ));
  }
}
//Vertical Linear gradient:
//used as such: 
//decoration: BoxDecoration(
//  gradient: linearGradientvertical),
var linearGradientvertical = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xFF76D3FF), Color(0xFF5C79FF)]);