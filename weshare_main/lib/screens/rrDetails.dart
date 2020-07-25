import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/services/database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
// import 'dart:async';

import 'constants.dart';

class RrDetails extends StatefulWidget {
  @override
  _RrDetailsState createState() => _RrDetailsState();
}

class _RrDetailsState extends State<RrDetails> {
  CurrentRides ride;

  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated (GoogleMapController controller){
    _controller = controller;
    _location.onLocationChanged.listen((l){
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(l.latitude-0.008, l.longitude), zoom: 15,),),);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    ride = ModalRoute.of(context).settings.arguments;
    User user = Provider.of<User>(context);
    //  print(ride.availableSeats);
    //  print(ride.driver.name);
    return Scaffold(
      // backgroundColor: Colors.yellow,
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
      body: 
      Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(37.77483, -122.41942), zoom: 11,),
            myLocationEnabled: true,  
            onMapCreated: _onMapCreated,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       // color: Colors.blue,
          //       ),
          // ),
          Positioned(
            bottom: 10.0,
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
                                    child: FutureBuilder(
                            future: DatabaseService()
                                .getUserDetails(ride.did),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.photo) {
                                  FutureBuilder(
                                    future: DatabaseService()
                                        .getImage(ride.did),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                              ConnectionState.done &&
                                          snapshot.hasData)
                                        return CircleAvatar(
                                          child: ClipOval(
                                            child: snapshot.data,
                                          ),
                                          // backgroundImage: NetworkImage(snapshot.data.preview),
                                          radius: 20,
                                        );

                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting)
                                        return Container(
                                            child:
                                                Icon(Icons.person, size: 35));

                                      if (snapshot.connectionState ==
                                          ConnectionState.none) {
                                        return Container(
                                          child: Icon(Icons.person),
                                        );
                                      }
                                      return Container(
                                        child: Icon(Icons.person, size: 35),
                                      );
                                    },
                                  );
                                } else {
                                  Container(
                                      child: Icon(Icons.person, size: 35));
                                }

                              }
                              return Container(
                                      child: Icon(Icons.person, size: 35));
                            }
                            ),
                                    
                                    radius: 25,
                                  ),
                                  SizedBox(width: 10),
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

                                    child: Column(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                                width: 200,
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
                                                      overflow: TextOverflow.ellipsis, 

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
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                                width: 200,
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
                                                      overflow: TextOverflow.ellipsis, 
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
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: FlatButton(
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(5.0),
                          // ),
                          onPressed: () {
                            AlertDialog warning = AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              title: Image.asset(
                                'assets/confused.png',
                                height: 110,
                              ),
                              content:
                                  Text('Would you like to cancel the trip?',
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
                                        .leaveRide(ride, user.uid);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                            showDialog(context: context, child: warning);
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
    );
  }
}
