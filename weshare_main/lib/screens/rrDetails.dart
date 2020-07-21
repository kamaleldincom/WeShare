import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/services/database.dart';

import 'constants.dart';

class RrDetails extends StatefulWidget {
  @override
  _RrDetailsState createState() => _RrDetailsState();
}

class _RrDetailsState extends State<RrDetails> {
  CurrentRides ride;
  @override
  Widget build(BuildContext context) {
    ride = ModalRoute.of(context).settings.arguments;
    User user = Provider.of<User>(context);
    //  print(ride.availableSeats);
    //  print(ride.driver.name);
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Color(0xFF5C79FF),
        ),
        elevation: 0,
        centerTitle: true,
        //title: Text('Text'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  ),
            ),
            Positioned(
              bottom: 48.0,
              left: 10.0,
              right: 10.0,
              child: Column(
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(0),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                      // borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    child: chatsLT(context),
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                      // borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 60,
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/person1.jpeg'),
                                      radius: 25,
                                    ),
                                    Text(
                                      '${ride.driver.name}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FlatButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                color: Colors.greenAccent[200],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                    Text('Call Driver',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),

                          // padding: EdgeInsets.only(top: 10),
                          // height: 55,
                          child: Column(
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
                                                  ride.from,
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
                                                  ride.to,
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
                                          '${ride.price}',
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
                                                      '${ride.driver.car.color}' +
                                                          ' ${ride.driver.car.type}',
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
                                                          color: Colors.grey)),
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
                                                    '${ride.driver.car.plateNumber}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white))),
                                          )
                                        ]),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: FlatButton(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(5.0),
                            // ),
                            onPressed: () {
                              print('ride id: ${ride.rid}');
                              DatabaseService().leaveRide(ride.rid, user.uid);
                              Navigator.pop(context);
                            },
                            color: Colors.grey,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 320.0, minHeight: 45),
                              alignment: Alignment.center,
                              child: Text('Leave Ride',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
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
}
