import 'package:flutter/material.dart';
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

    
// The main button with (like the the login in)
//just pass a text and your're ready to go
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



// Card for the current ride Screen pass context, text for the button and color
// e.g. currentRIdeCard(context,'Start Ride', Colors.green)

Container currentRideCard(BuildContext context, String text, var color) {
    return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.only(bottom: 20),
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Container(
                        height: 52,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(0),
                                  height: 16,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  height: 16,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(' Electrical (FKE) P05'),
                                Text(' Electrical (FKE) P05'),
                              ],
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            startLeaveButton(text ,color),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 8),
                        decoration: BoxDecoration(
                          // color: ,
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 0, 10),
                              child: Text(
                                'Chats',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.blue[300],
                                        child: Text(
                                          '+1',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.blue[300],
                                        child: Text(
                                          '+1',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.blue[300],
                                        child: Text(
                                          '+1',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '7:43 AM',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        'Mutasim: I’m waiting in fro…',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 26,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).accentColor,
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }

  Container startLeaveButton(String text, var color) {
    return Container(
      height: 50.0,
      constraints: BoxConstraints(maxWidth: 130.0, maxHeight: 45),
      child: FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: color,
        child: Container(
          constraints: BoxConstraints(maxWidth: 115.0, maxHeight: 50),
          alignment: Alignment.center,
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
}

//---------------------------------------------------------------------------------------------------------------