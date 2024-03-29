import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/screens/driver_registeration.dart';
import 'package:weshare_main/services/auth.dart';
import 'package:weshare_main/services/database.dart';

import 'constants.dart';

class Profile extends StatefulWidget {
  // int index;
  final String usertype;
  Profile(this.usertype);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthService _auth = AuthService();
  DatabaseService databaseService = DatabaseService();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    databaseService.getUserDetails(user.uid);

    // databaseService.getUserDetails(user.uid);
    // print(user.email);
    // User user1;
    if (user.uid != null)
      return FutureBuilder<User>(
          future: databaseService.getUserDetails(user.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              user = snapshot.data;
              return WillPopScope(
                onWillPop: () => Future.value(false),
                child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: Color(0xFFF1F3F5),
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      '${user.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.settings),
                        tooltip: 'Settings',
                        onPressed: () {
                          Navigator.pushNamed(
                            context, '/settings',
                            arguments: widget.usertype);
                        },
                      ),
                    ],
                    elevation: 0.0,
                    centerTitle: true,
                    backgroundColor: Color(0xFF76D3FF),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          // height: 270.0,
                          
                          decoration:
                              BoxDecoration(gradient: linearGradientvertical),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 40,
                                      child: user.photo
                                      ? FutureBuilder(
                                          future: DatabaseService()
                                              .getImage(user.uid),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                    ConnectionState.done &&
                                                snapshot.hasData)
                                              return CircleAvatar(
                                                child: ClipOval(
                                                  child: snapshot.data,
                                                ),
                                                radius: 45,
                                              );
                                            else if (snapshot.connectionState ==
                                                ConnectionState.waiting)
                                              return Container(
                                                  child: Icon(Icons.person,
                                                      size: 70));
                                            else if (snapshot.connectionState ==
                                                ConnectionState.none) {
                                              return Container(
                                                child: Icon(Icons.person),
                                              );
                                            }
                                            return Container(
                                              child: Icon(Icons.person, size: 70),
                                            );
                                          },
                                        )
                                      : Container(
                                          child: Icon(Icons.person, size: 30),
                                        ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                      // Text(
                                      //   '${user.name}',
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontSize: 16.0,
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 5.0,
                                      // ),
                                      Text(
                                        '${user.phoneNumber}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        '${user.email}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      
                                      user.isDriver ?
                                      Text('')
                                      :
                                      FlatButton(
                                        // color: Colors.white,
                                        // textColor: Colors.white,
                                        // disabledColor: Colors.grey,
                                        // disabledTextColor: Colors.black,
                                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                                        // splashColor: Colors.blueAccent,
                                        shape: RoundedRectangleBorder(side: BorderSide(
                                          color: Colors.white,
                                          
                                          width: 1,
                                          style: BorderStyle.solid
                                        ), borderRadius: BorderRadius.circular(50)),
                                        onPressed: (){
                                          AlertDialog warning = AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0)),
                                            title: Image.asset(
                                              'assets/confused.png',
                                              height: 110,
                                            ),
                                            content: Container(
                                              height: 370,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                      'Let\'s make our network even bigger...',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                      )),
                                                  SizedBox(height: 7),
                                                  Text('WELCOME ON BOARD! ⚡🚗',
                                                      textAlign: TextAlign.right,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                      )),
                                                  SizedBox(height: 25),
                                                  Text(
                                                      ' You just need to enter your basic info to apply in FOUR easy steps:',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      )),
                                                  SizedBox(height: 20),
                                                  Text('* A Selfie.',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      )),
                                                  Text('* Your IC/Passport Photo.',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      )),
                                                  Text('* Your license Photo.',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      )),
                                                  Text(
                                                      '* Your car details (type, color, and plate number)',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      )),
                                                  SizedBox(height: 20),
                                                  Text('That\'s it!!',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      )),
                                                  SizedBox(height: 50),
                                                  FlatButton(
                                                    onPressed: () async {
                                                      Navigator.pushNamed(
                                                          context, '/editCarDetails');

                                                      // Navigator.pushNamed(
                                                      //         _scaffoldKey.currentContext ,
                                                      //            '/driverRegistration');
                                                    },
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Theme.of(context)
                                                              .accentColor,
                                                          width: 2.5),
                                                      borderRadius:
                                                          BorderRadius.circular(10.0),
                                                    ),
                                                    child: Container(
                                                      constraints: BoxConstraints(
                                                          maxWidth: 310.0,
                                                          minHeight: 60.0),
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        'Let\'s Get Started!',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: Theme.of(context)
                                                              .accentColor,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                          showDialog(
                                              context: _scaffoldKey.currentContext,
                                              child: warning);
                                        },
                                        child: Text('Become a Driver', style: TextStyle(color: Colors.white),)
                                      )
                                    ]),
                                    
                                  ],
                                ),
                              ),
                              // SizedBox(height: 20)
                            ],
                          ),
                          
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        
                        user.isDriver ?
                        
                        Column(
                          children: [
                            Text(
                          'Switch Mode',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                            Container(
                              height: 60,
                              margin: EdgeInsets.all(15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: <Color>[
                                        Color(0xFF9ADAFC),
                                        Color(0xFF8496FD)
                                      ])),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width:MediaQuery.of(context).size.width/2-25,
                                      height:MediaQuery.of(context).size.height,
                                      
                                      child: FlatButton(
                                        color: widget.usertype == 'Rider'
                                            ? Colors.white
                                            : Colors.transparent,
                                        // padding: EdgeInsets.fromLTRB(65, 10, 65, 10),
                                        
                                        
                                        
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                      BtmNavBar()));
                                        },
                                        child: Text(
                                          'Rider',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: widget.usertype == 'Rider'
                                                ? Color(0xFF5C79FF)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(7.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:MediaQuery.of(context).size.width/2-25,
                                      height:MediaQuery.of(context).size.height,
                                      
                                      child: FlatButton(
                                        color: widget.usertype == 'Driver'
                                            ? Colors.white
                                            : Colors.transparent,
                                        // padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                                        onPressed: () {
                                          // Navigator.pushReplacementNamed(context, '/driverNav');
                                          // Navigator.pushNamed(
                                          //         _scaffoldKey.currentContext ,
                                          //            '/driverRegistration');

                                          if (user.isDriver) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext context) =>
                                                        BtnDriver()));
                                          } else {
                                            // pop-uo for driver registration
                                            AlertDialog warning = AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10.0)),
                                              title: Image.asset(
                                                'assets/confused.png',
                                                height: 110,
                                              ),
                                              content: Container(
                                                height: 370,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                        'Let\'s make our network even bigger...',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14,
                                                        )),
                                                    SizedBox(height: 7),
                                                    Text('WELCOME ON BOARD! ⚡🚗',
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                        )),
                                                    SizedBox(height: 25),
                                                    Text(
                                                        ' You just need to enter your basic info to apply in FOUR easy steps:',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        )),
                                                    SizedBox(height: 20),
                                                    Text('* A Selfie.',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        )),
                                                    Text('* Your IC/Passport Photo.',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        )),
                                                    Text('* Your license Photo.',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        )),
                                                    Text(
                                                        '* Your car details (type, color, and plate number)',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        )),
                                                    SizedBox(height: 20),
                                                    Text('That\'s it!!',
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        )),
                                                    SizedBox(height: 50),
                                                    FlatButton(
                                                      onPressed: () async {
                                                        Navigator.pushNamed(
                                                            context, '/editCarDetails');

                                                        // Navigator.pushNamed(
                                                        //         _scaffoldKey.currentContext ,
                                                        //            '/driverRegistration');
                                                      },
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Theme.of(context)
                                                                .accentColor,
                                                            width: 2.5),
                                                        borderRadius:
                                                            BorderRadius.circular(10.0),
                                                      ),
                                                      child: Container(
                                                        constraints: BoxConstraints(
                                                            maxWidth: 310.0,
                                                            minHeight: 60.0),
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          'Let\'s Get Started!',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            color: Theme.of(context)
                                                                .accentColor,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                            showDialog(
                                                context: _scaffoldKey.currentContext,
                                                child: warning);
                                          }
                                        },
                                        child: Text(
                                          'Driver',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: widget.usertype == 'Driver'
                                                ? Color(0xFF5C79FF)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(7.0),
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ],
                        )
                        :
                        Text('')
                        ,
                        Container(
                          height: 200,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          });
    // bottomNavigationBar: BtmNavBar());
  }
}
