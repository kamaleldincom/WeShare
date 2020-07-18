import 'package:flutter/material.dart';
import 'package:weshare_main/screens/driver_registeration.dart';
import 'package:weshare_main/services/auth.dart';

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

   final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFF1F3F5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Color(0xFF76D3FF),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 270.0,
              decoration: BoxDecoration(gradient: linearGradientvertical),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/person.jpeg'),
                        radius: 48.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                    child: Center(
                      child: Column(children: <Widget>[
                        Text(
                          'Ahmed Kamal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '+60130000000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'ahmed@kamaleldin.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 13),
                            onPressed: () {},
                            child: Text(
                              'Help & Support',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Builder(builder: (context) {
                            return FlatButton(
                              onPressed: () async{
                                Navigator.pushNamed(context, '/settings',
                                    arguments: widget.usertype);
                                  //   Navigator.pushNamed(context, '/login');
                                  // await _auth.signOut();
                                    // setState(() {
                                      
                                    // });
                              },
                              padding: EdgeInsets.fromLTRB(30, 13, 15, 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Switch Mode',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: <Color>[Color(0xFF9ADAFC), Color(0xFF8496FD)])),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      color: widget.usertype == 'Rider'
                          ? Colors.white
                          : Colors.transparent,
                      padding: EdgeInsets.fromLTRB(65, 10, 65, 10),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/nav');
                        
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
                    FlatButton(
                      color: widget.usertype == 'Driver'
                          ? Colors.white
                          : Colors.transparent,
                      padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/driverNav');
                        // Navigator.pushNamed(
                        //         _scaffoldKey.currentContext ,
                        //            '/driverRegistration');


                    //pop-uo for driver registration
                    //      AlertDialog warning = AlertDialog(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10.0)),
                    //       title: Image.asset(
                    //         'assets/confused.png',
                    //         height: 110,
                    //       ),
                    //       content: Container(
                    //         height: 370,
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: <Widget>[
                    //             Text('Let\'s make our network even bigger...',
                    //                 style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                 )),
                    //             Text('WELCOME ON BOARD!', textAlign: TextAlign.center,
                    //                 style: TextStyle(
                    //                   fontSize: 20,
                                      
                    //                 )),
                    //             SizedBox(height: 25),
                    //             Text(
                    //                 ' You just need to enter your basic info to apply in FOUR easy steps:',
                    //                 style: TextStyle()),
                    //             SizedBox(height: 20),
                    //             Text(
                    //                 '* A selfie.', textAlign: TextAlign.left,
                    //                ),
                    //             Text(
                    //                 '* Your IC/Passport No.',  textAlign: TextAlign.left,
                    //                ),
                    //             Text(
                    //                 '* Your license number.',  textAlign: TextAlign.left,
                    //                ),
                    //             Text(
                    //                 '* Your car details (type, color, and plate number)',  textAlign: TextAlign.left,
                    //                ),
                    //             SizedBox(height: 20),
                    //             Text(
                    //                 'That\'s it!!',  textAlign: TextAlign.left,
                    //                ),
                    //             SizedBox(height: 50),
                              
                          
                    //         FlatButton(
                    //   onPressed: () async {
                    //     Navigator.pushNamed(
                    //             _scaffoldKey.currentContext ,
                    //                '/driverRegistration');


                    //   },
                    //   color: Colors.white,
                    //   shape: RoundedRectangleBorder(
                    //     side: BorderSide(
                    //         color: Theme.of(context).accentColor, width: 2.5),
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: Container(
                    //     constraints:
                    //         BoxConstraints(maxWidth: 310.0, minHeight: 60.0),
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       'Next',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         color: Theme.of(context).accentColor,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //     ),
                    //   ),
                    // )
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //     showDialog(context: _scaffoldKey.currentContext, child: warning);
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
                    )
                  ]),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
    // bottomNavigationBar: BtmNavBar());
  }
}
