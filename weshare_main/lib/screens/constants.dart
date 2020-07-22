import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/mock_data.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/screens/postRide.dart';
import 'package:weshare_main/services/database.dart';
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

// The main button with gradient (like the login in)
//just pass a text and your're ready to go
Ink buttonWithGradient(String text, [double maxwidth = 310]) {
  //assign to a child inside any button and pass the text you like
  return Ink(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xFF76D3FF), Color(0xFF5C79FF)]),
        borderRadius: BorderRadius.circular(10.0)),
    child: Container(
      constraints: BoxConstraints(maxWidth: maxwidth, minHeight: 60.0),
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

////////////////////////////
/// Rider Navigation Bar ///
/// ////////////////////////////
class BtmNavBar extends StatefulWidget {
  @override
  _BtmNavBarState createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  int _currentIndex = 0;

  // void onTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Dashboard(),
      Rides(rides, 'Rider'),
      Notifications(),
      Profile('Rider'),
    ];
    return StreamProvider<List<Ride>>.value(
      value: DatabaseService().rides,
      child: Scaffold(
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
          )),
    );
  }
}

////////////////////////////
/// Driver Navigation Bar ///
/// ////////////////////////
class BtnDriver extends StatefulWidget {
  @override
  _BtnDriverState createState() => _BtnDriverState();
}

class _BtnDriverState extends State<BtnDriver> {
  int _currentIndex = 3;
  final List<Widget> _pages = [
    PostRideInterface(),
    Rides(rides, 'Driver'),
    Notifications(),
    Profile('Driver'),
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
                Icons.add_circle,
                size: 30,
              ),
              title: Text(
                'Add Ride',
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

// title:  is the title of your page
// backArrowNeeded:
//        true - if you need a backbutton to return to previous page
//          false - if you don't need a back button
//  actionsToDo :  add widgets in the appBar (if needed)

Widget appBarBuilder(title, bool backArrowNeeded, actionsToDo) {
  return AppBar(
      brightness: Brightness.light,
      automaticallyImplyLeading: false,
      leading: backArrowNeeded
          ? BackButton(
              color: Color(0xFF5C79FF),
            )
          : null,
      backgroundColor: Color(0xFFF1F3F5),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0.0,
      centerTitle: true,
      actions: actionsToDo);
}

// Add this to notification page in actionsToDo
// <Widget>[
//             IconButton(
//               icon: Icon(Icons.delete_outline),
//               iconSize: 26,
//               color: Color(0xFF5C79FF),
//               onPressed: (){},
//             )
//           ],

// Card for the current ride Screen pass context, text for the button and color
// e.g. currentRIdeCard(context,'Start Ride', Colors.green)

Container currentRideCard(
    BuildContext context, CurrentRides _rides, String usertype) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 10,
    ),
    padding: EdgeInsets.only(bottom: 20),
    child: Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (usertype == 'Rider')
                  Navigator.pushNamed(context, "/RrDetails",arguments: _rides);
                else if (usertype == 'Driver') {
                  Navigator.pushNamed(context, "/startEndRide",  arguments: _rides );
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 50,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/person1.jpeg'),
                              radius: 25,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${_rides.driver.name}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      // height: 55,
                      child: usertype == 'Rider'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      // height: 70,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Text(
                                                    'Origin',
                                                    style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.grey[500],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.trip_origin,
                                                    color: Color(0xFF686868),
                                                    size: 15,
                                                  ),
                                                  Text(
                                                    _rides.from,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Text('Destination',
                                                      style: TextStyle(
                                                        fontSize: 9,
                                                        color: Colors.grey[500],
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.brightness_1,
                                                    color: Color(0xFF686868),
                                                    size: 15,
                                                  ),
                                                  Text(
                                                    _rides.to,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'MYR',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            '${_rides.price}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 22,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      // height: 70,
                                      // width: 150,

                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.directions_car,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                        '${_rides.driver.car.color}' +
                                                            ' ${_rides.driver.car.type}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15)),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.timer,
                                                      color: Colors.red,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('12 minutes...',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12,
                                                            color:
                                                                Colors.grey)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 35,
                                              padding: EdgeInsets.only(
                                                  left: 7, right: 7),
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                      '${_rides.driver.car.plateNumber}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.white))),
                                            )
                                          ]),
                                    )),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                'Origin',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.trip_origin,
                                                color: Color(0xFF686868),
                                                size: 15,
                                              ),
                                              Text(
                                                _rides.from,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text('Destination',
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.grey[500],
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.brightness_1,
                                                color: Color(0xFF686868),
                                                size: 15,
                                              ),
                                              Text(
                                                _rides.to,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {
                                      // index == 0?
                                      if (usertype == 'Rider') {
                                      } else {
                                        Navigator.pushNamed(
                                            context, "/startEndRide", arguments: _rides);
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    color: Colors.greenAccent,
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 115.0, maxHeight: 50),
                                      alignment: Alignment.center,
                                      child: Text('Start Ride',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pushNamed(context, '/chatScreen');
              },
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 8),
                decoration: BoxDecoration(
                  // color: ,
                  color: Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    child: Stack(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('assets/driver.png'),
                                          radius: 15,
                                        ),
                                        Positioned(
                                          left: 12,
                                          child: CircleAvatar(
                                            backgroundImage:
                                                AssetImage('assets/driver.png'),
                                            radius: 15,
                                          ),
                                        ),
                                        Positioned(
                                          left: 25,
                                          child: CircleAvatar(
                                            backgroundImage:
                                                AssetImage('assets/driver.png'),
                                            radius: 15,
                                          ),
                                        ),
                                        Positioned(
                                          left: 25,
                                          child: CircleAvatar(
                                            backgroundImage:
                                                AssetImage('assets/driver.png'),
                                            radius: 15,
                                          ),
                                        ),
                                        Positioned(
                                          left: 37,
                                          child: CircleAvatar(
                                            child: Text('+1'),
                                            radius: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 15),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            ],
                          ),
                          Container(
                            height: 26,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).accentColor,
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
            ),
          ],
        ),
        Positioned(
            right: 10,
            child: Container(
              height: 40,
              constraints: BoxConstraints(maxWidth: 100, minWidth: 100),
              padding: EdgeInsets.only(left: 7, right: 7),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                // border: Border.all(color: Colors.black, width: 1),
              ),
              child: Center(
                  child: Text('${_rides.dateTime}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white))),
            )),
      ]),
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

//chats List tile
ListTile chatsLT(BuildContext context) {
  return ListTile(
    onTap: () {
      Navigator.pushNamed(context, '/chatScreen');
    },
    contentPadding: EdgeInsets.only(left: 12, right: 25),
    leading: Container(
      width: 70,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Chat',
                style: TextStyle(color: Colors.grey[400], fontSize: 11),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              Container(
                width: 70,
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/driver.png'),
                      radius: 15,
                    ),
                    Positioned(
                      left: 12,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/driver.png'),
                        radius: 15,
                      ),
                    ),
                    Positioned(
                      left: 25,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/driver.png'),
                        radius: 15,
                      ),
                    ),
                    Positioned(
                      left: 25,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/driver.png'),
                        radius: 15,
                      ),
                    ),
                    Positioned(
                      left: 37,
                      child: CircleAvatar(
                        child: Text('+1'),
                        radius: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    title: Text('7:45 AM',
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey[500],
        )),
    subtitle: Text('You: Be in front gate guys!',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey[500],
        )),
    trailing: Badge(
      badgeColor: Color(0xFF5C79FF),
      borderRadius: 50,
      toAnimate: true,
      badgeContent: Text('1', style: TextStyle(color: Colors.white)),
    ),
  );
}
