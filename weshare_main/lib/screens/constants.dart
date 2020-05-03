import 'package:badges/badges.dart';
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
  int _currentIndex = 0;
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

Container currentRideCard(BuildContext context, String text, var color) {
    return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.only(bottom: 20),
                child: Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "/RrDetails");
                        },
                        child: Column(
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
                              padding: EdgeInsets.symmetric(horizontal:10),
                              height: 52,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.trip_origin,
                                            color: Color(0xFF686868),
                                            size: 15,
                                          ),
                                          Text(' Electrical (FKE) P05'),
    
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.brightness_1,
                                            color: Color(0xFF686868),
                                            size: 15,
                                          ),
                                          Text(' Electrical (FKE) P05'),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  startLeaveButton(text ,color),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: (){
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

//chats List tile 
ListTile chatsLT(BuildContext context) {
    return ListTile(
      onTap: (){
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
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 11),
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
        badgeContent:
            Text('1', style: TextStyle(color: Colors.white)),
      ),
    );
  }