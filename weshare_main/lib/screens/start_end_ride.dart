import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/services/database.dart';
import './constants.dart';

class StartEndRideInterface extends StatefulWidget {
  @override
  _StartEndRideInterfaceState createState() => _StartEndRideInterfaceState();
}

class _StartEndRideInterfaceState extends State<StartEndRideInterface> {
  bool rideStarted = false;
  CurrentRides ride;
  @override
  Widget build(BuildContext context) {
    ride = ModalRoute.of(context).settings.arguments;
    User user = Provider.of<User>(context);
    // print('ride from start $ride');
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        brightness: Brightness.light,
        leading: BackButton(
          color: Color(0xFF5C79FF),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          // MAP GOES HERE

          //! Chat Info.
          Positioned(
            // top: MediaQuery.of(context).size.height / 2,
            left: 0,
            right: 0,
            bottom: 10,
            child: Column(
              children: <Widget>[
                Container(
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 17),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: chatsLT(context),
                  ),
                ),
                SizedBox(height: 0.7),
                //! Trip Card
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 1,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.trip_origin,
                                          color: Theme.of(context).accentColor,
                                          size: 15,
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          width: 140,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Title(
                                                color: Colors.black,
                                                child: Text(
                                                  'From',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                ride.from,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.grey[800],
                                                ),
                                                overflow: TextOverflow.fade,
                                              ),
                                            ],
                                            // brightness_1
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.brightness_1,
                                          color: Theme.of(context).accentColor,
                                          size: 15,
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          width: 140,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Title(
                                                color: Colors.black,
                                                child: Text(
                                                  'To',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                ride.to,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                                overflow: TextOverflow.fade,
                                              ),
                                            ],
                                            // brightness_1
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            rideStarted
                                ? Container()
                                : Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Title(
                                          color: Colors.black,
                                          child: Text(
                                            'Ride time',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          '${ride.dateTime}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(height: rideStarted ? 35 : 15),
                        SizedBox(
                            width: double.infinity,
                            height: 43,
                            child: rideStarted
                                ? FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    color: Color(0xFF5C79FF),
                                    child: Text('END RIDE',
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      DatabaseService().endRide(ride, user.uid);
                                      Navigator.of(context).pop();
                                    },
                                  )
                                : FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    color: Colors.green[400],
                                    child: Text('START RIDE',
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      DatabaseService()
                                          .startRide(ride, user.uid);
                                      setState(() {
                                        rideStarted = true;
                                      });
                                    },
                                  )),
                        SizedBox(height: rideStarted ? 0 : 13),
                        SizedBox(
                          width: double.infinity,
                          height: rideStarted ? 20 : 43,
                          child: rideStarted
                              ? null
                              : FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  color: Colors.grey[500],
                                  child: Text('CANCEL',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    AlertDialog warning = AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      title: Image.asset(
                                        'assets/confused.png',
                                        height: 110,
                                      ),
                                      content: Text(
                                          'Would you like to cancel the trip?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('No'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        FlatButton(
                                          child: Text('Yes'),
                                          onPressed: () {
                                            DatabaseService()
                                                .cancelRide(ride, user.uid);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                    showDialog(
                                        context: context, child: warning);
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
