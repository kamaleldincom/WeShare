import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/services/database.dart';
import './constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class StartEndRideInterface extends StatefulWidget {
  @override
  _StartEndRideInterfaceState createState() => _StartEndRideInterfaceState();
}

class _StartEndRideInterfaceState extends State<StartEndRideInterface> {
  bool rideStarted = false;
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
    bool loaded = false;
    // print('ride from start $ride');
    return Scaffold(
      // backgroundColor: Colors.yellow,
      // appBar: AppBar(
      //   brightness: Brightness.light,
      //   leading: BackButton(
      //     color: Color(0xFF5C79FF),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      // ),
      body: Stack(
        children: <Widget>[
          // MAP GOES HERE
          GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(1.559701, 103.637786), zoom: 11,),
            myLocationEnabled: true,  
            onMapCreated: _onMapCreated,
          ),
          Positioned(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Container(
                  // height: 20,
                  // width: 20,
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                    // gradient: linearGradientvertical,
                    color: Colors.white,
                    
                  ),
                  
                  child: BackButton(
                    color: Theme.of(context).accentColor,
                    
                  ),
                ),
              ),
            ),
          //! Chat Info.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: DraggableScrollableSheet(
              initialChildSize: 0.28,
              minChildSize: 0.12,
              maxChildSize: 0.5,
              builder: ( context, controller){
                return SingleChildScrollView(
                  controller: controller,
                  
                  child: Container(
                    // height: MediaQuery.of(context).size.height/2.25,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)
                    ),
                    color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Card(
                          // margin: EdgeInsets.symmetric(horizontal: 17),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: chatsLT(context,ride),
                        ),
                        SizedBox(height: 0.7),
                  //! Trip Card
                    Container(
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
                                            fontSize: 13,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        OutlineButton(
                                            borderSide: BorderSide(
                                                color: Color(0xFF5C79FF)),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.people,
                                                  color: Color(0xFF5C79FF),
                                                ),
                                                SizedBox(
                                                  width: 1,
                                                ),
                                                Text(
                                                  'View Riders',
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              if (!loaded)
                                                CircularProgressIndicator();

                                              DatabaseService()
                                                  .getMyRiders(ride)
                                                  .then((users) {
                                                loaded = true;
                                                AlertDialog warning =
                                                    AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  title: Text(
                                                      'My Riders (${users.length})'),
                                                  content: Container(
                                                    //   MediaQuery.of(context).size.height / 6)
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            4,
                                                    child: ListView.separated(
                                                        separatorBuilder:
                                                            (BuildContext context,
                                                                    int
                                                                        index) =>
                                                                Divider(
                                                                    height: 3,
                                                                    color: Colors
                                                                            .grey[
                                                                        400]),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        // itemExtent: 100.0,
                                                        shrinkWrap: true,
                                                        itemCount: users.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return SingleChildScrollView(
                                                            child: ListTile(
                                                              leading: Text(
                                                                users[index]
                                                                    .name,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              trailing:
                                                                  GestureDetector(
                                                                      child:
                                                                          Chip(
                                                                        backgroundColor:
                                                                            Colors.green[600],
                                                                        label:
                                                                            Text(
                                                                          '📞${users[index].phoneNumber}',
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        print(
                                                                            'pressed');
                                                                        FlutterPhoneDirectCaller.callNumber(
                                                                            users[index].phoneNumber);
                                                                      }),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                  actions: [
                                                    FlatButton(
                                                      child: Text('DISMISS'),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                );
                                                showDialog(
                                                    context: context,
                                                    child: warning);
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
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
                
                      ],
                    ),
                  ),
                );
              },
              ),
          )
          // Positioned(
          //   // top: MediaQuery.of(context).size.height / 2,
          //   left: 0,
          //   right: 0,
          //   bottom: 10,
          //   child: Column(
          //     children: <Widget>[
          //       Container(
          //         child: Card(
          //           margin: EdgeInsets.symmetric(horizontal: 17),
          //           shape: RoundedRectangleBorder(
          //               side: BorderSide(color: Colors.grey[400]),
          //               borderRadius: BorderRadius.circular(10.0)),
          //           child: chatsLT(context,ride),
          //         ),
          //       ),
          //       SizedBox(height: 0.7),
          //       //! Trip Card
          //       Card(
          //         margin: EdgeInsets.symmetric(horizontal: 17),
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10)),
          //         elevation: 1,
          //         child: Container(
          //           padding: EdgeInsets.all(15),
          //           child: Column(
          //             children: <Widget>[
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: <Widget>[
          //                   Container(
          //                     child: Column(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: <Widget>[
          //                         Container(
          //                           margin: EdgeInsets.all(0),
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.start,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: <Widget>[
          //                               Icon(
          //                                 Icons.trip_origin,
          //                                 color: Theme.of(context).accentColor,
          //                                 size: 15,
          //                               ),
          //                               SizedBox(width: 5),
          //                               Container(
          //                                 width: 140,
          //                                 child: Column(
          //                                   mainAxisAlignment:
          //                                       MainAxisAlignment.spaceBetween,
          //                                   crossAxisAlignment:
          //                                       CrossAxisAlignment.start,
          //                                   children: <Widget>[
          //                                     Title(
          //                                       color: Colors.black,
          //                                       child: Text(
          //                                         'From',
          //                                         style: TextStyle(
          //                                           fontWeight: FontWeight.w300,
          //                                           fontSize: 11,
          //                                           color: Colors.grey,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                     Text(
          //                                       ride.from,
          //                                       style: TextStyle(
          //                                         fontWeight: FontWeight.w500,
          //                                         fontSize: 15,
          //                                         color: Colors.grey[800],
          //                                       ),
          //                                       overflow: TextOverflow.fade,
          //                                     ),
          //                                   ],
          //                                   // brightness_1
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           height: 10,
          //                         ),
          //                         Container(
          //                           margin: EdgeInsets.all(0),
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.start,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: <Widget>[
          //                               Icon(
          //                                 Icons.brightness_1,
          //                                 color: Theme.of(context).accentColor,
          //                                 size: 15,
          //                               ),
          //                               SizedBox(width: 5),
          //                               Container(
          //                                 width: 140,
          //                                 child: Column(
          //                                   mainAxisAlignment:
          //                                       MainAxisAlignment.spaceBetween,
          //                                   crossAxisAlignment:
          //                                       CrossAxisAlignment.start,
          //                                   children: <Widget>[
          //                                     Title(
          //                                       color: Colors.black,
          //                                       child: Text(
          //                                         'To',
          //                                         style: TextStyle(
          //                                           fontWeight: FontWeight.w300,
          //                                           fontSize: 11,
          //                                           color: Colors.grey,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                     Text(
          //                                       ride.to,
          //                                       style: TextStyle(
          //                                         fontWeight: FontWeight.w400,
          //                                         fontSize: 15,
          //                                         color: Colors.grey,
          //                                       ),
          //                                       overflow: TextOverflow.fade,
          //                                     ),
          //                                   ],
          //                                   // brightness_1
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   rideStarted
          //                       ? Container()
          //                       : Container(
          //                           margin: EdgeInsets.only(right: 10),
          //                           child: Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: <Widget>[
          //                               Title(
          //                                 color: Colors.black,
          //                                 child: Text(
          //                                   'Ride time',
          //                                   style: TextStyle(
          //                                     fontWeight: FontWeight.w300,
          //                                     fontSize: 11,
          //                                     color: Colors.grey,
          //                                   ),
          //                                 ),
          //                               ),
          //                               SizedBox(
          //                                 height: 2,
          //                               ),
          //                               Text(
          //                                 '${ride.dateTime}',
          //                                 style: TextStyle(
          //                                   fontWeight: FontWeight.w500,
          //                                   fontSize: 13,
          //                                   color: Colors.grey[800],
          //                                 ),
          //                               ),
          //                               SizedBox(
          //                                 height: 4,
          //                               ),
          //                               OutlineButton(
          //                                   borderSide: BorderSide(
          //                                       color: Color(0xFF5C79FF)),
          //                                   child: Row(
          //                                     children: [
          //                                       Icon(
          //                                         Icons.people,
          //                                         color: Color(0xFF5C79FF),
          //                                       ),
          //                                       SizedBox(
          //                                         width: 1,
          //                                       ),
          //                                       Text(
          //                                         'View Riders',
          //                                         style:
          //                                             TextStyle(fontSize: 13),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                   onPressed: () {
          //                                     if (!loaded)
          //                                       CircularProgressIndicator();

          //                                     DatabaseService()
          //                                         .getMyRiders(ride)
          //                                         .then((users) {
          //                                       loaded = true;
          //                                       AlertDialog warning =
          //                                           AlertDialog(
          //                                         shape: RoundedRectangleBorder(
          //                                             borderRadius:
          //                                                 BorderRadius.circular(
          //                                                     10.0)),
          //                                         title: Text(
          //                                             'My Riders (${users.length})'),
          //                                         content: Container(
          //                                           //   MediaQuery.of(context).size.height / 6)
          //                                           width:
          //                                               MediaQuery.of(context)
          //                                                   .size
          //                                                   .width,
          //                                           height:
          //                                               MediaQuery.of(context)
          //                                                       .size
          //                                                       .height /
          //                                                   4,
          //                                           child: ListView.separated(
          //                                               separatorBuilder:
          //                                                   (BuildContext context,
          //                                                           int
          //                                                               index) =>
          //                                                       Divider(
          //                                                           height: 3,
          //                                                           color: Colors
          //                                                                   .grey[
          //                                                               400]),
          //                                               scrollDirection:
          //                                                   Axis.vertical,
          //                                               // itemExtent: 100.0,
          //                                               shrinkWrap: true,
          //                                               itemCount: users.length,
          //                                               itemBuilder:
          //                                                   (context, index) {
          //                                                 return SingleChildScrollView(
          //                                                   child: ListTile(
          //                                                     leading: Text(
          //                                                       users[index]
          //                                                           .name,
          //                                                       style: TextStyle(
          //                                                           fontSize:
          //                                                               14),
          //                                                     ),
          //                                                     trailing:
          //                                                         GestureDetector(
          //                                                             child:
          //                                                                 Chip(
          //                                                               backgroundColor:
          //                                                                   Colors.green[600],
          //                                                               label:
          //                                                                   Text(
          //                                                                 '📞${users[index].phoneNumber}',
          //                                                                 style:
          //                                                                     TextStyle(color: Colors.white),
          //                                                               ),
          //                                                             ),
          //                                                             onTap:
          //                                                                 () {
          //                                                               print(
          //                                                                   'pressed');
          //                                                               FlutterPhoneDirectCaller.callNumber(
          //                                                                   users[index].phoneNumber);
          //                                                             }),
          //                                                   ),
          //                                                 );
          //                                               }),
          //                                         ),
          //                                         actions: [
          //                                           FlatButton(
          //                                             child: Text('DISMISS'),
          //                                             onPressed: () {
          //                                               Navigator.pop(context);
          //                                             },
          //                                           ),
          //                                         ],
          //                                       );
          //                                       showDialog(
          //                                           context: context,
          //                                           child: warning);
          //                                     });
          //                                   },
          //                                   shape: RoundedRectangleBorder(
          //                                       borderRadius:
          //                                           BorderRadius.circular(
          //                                               30.0))),
          //                             ],
          //                           ),
          //                         ),
          //                 ],
          //               ),
          //               SizedBox(height: rideStarted ? 35 : 15),
          //               SizedBox(
          //                   width: double.infinity,
          //                   height: 43,
          //                   child: rideStarted
          //                       ? FlatButton(
          //                           shape: RoundedRectangleBorder(
          //                               borderRadius:
          //                                   BorderRadius.circular(5.0)),
          //                           color: Color(0xFF5C79FF),
          //                           child: Text('END RIDE',
          //                               style: TextStyle(color: Colors.white)),
          //                           onPressed: () {
          //                             DatabaseService().endRide(ride, user.uid);
          //                             Navigator.of(context).pop();
          //                           },
          //                         )
          //                       : FlatButton(
          //                           shape: RoundedRectangleBorder(
          //                               borderRadius:
          //                                   BorderRadius.circular(5.0)),
          //                           color: Colors.green[400],
          //                           child: Text('START RIDE',
          //                               style: TextStyle(color: Colors.white)),
          //                           onPressed: () {
          //                             DatabaseService()
          //                                 .startRide(ride, user.uid);
          //                             setState(() {
          //                               rideStarted = true;
          //                             });
          //                           },
          //                         )),
          //               SizedBox(height: rideStarted ? 0 : 13),
          //               SizedBox(
          //                 width: double.infinity,
          //                 height: rideStarted ? 20 : 43,
          //                 child: rideStarted
          //                     ? null
          //                     : FlatButton(
          //                         shape: RoundedRectangleBorder(
          //                             borderRadius: BorderRadius.circular(5.0)),
          //                         color: Colors.grey[500],
          //                         child: Text('CANCEL',
          //                             style: TextStyle(color: Colors.white)),
          //                         onPressed: () {
          //                           AlertDialog warning = AlertDialog(
          //                             shape: RoundedRectangleBorder(
          //                                 borderRadius:
          //                                     BorderRadius.circular(10.0)),
          //                             title: Image.asset(
          //                               'assets/confused.png',
          //                               height: 110,
          //                             ),
          //                             content: Text(
          //                                 'Would you like to cancel the trip?',
          //                                 style: TextStyle(
          //                                   fontWeight: FontWeight.bold,
          //                                 )),
          //                             actions: <Widget>[
          //                               FlatButton(
          //                                 child: Text('No'),
          //                                 onPressed: () {
          //                                   Navigator.pop(context);
          //                                 },
          //                               ),
          //                               FlatButton(
          //                                 child: Text('Yes'),
          //                                 onPressed: () {
          //                                   DatabaseService()
          //                                       .cancelRide(ride, user.uid);
          //                                   Navigator.pop(context);
          //                                   Navigator.pop(context);
          //                                 },
          //                               ),
          //                             ],
          //                           );
          //                           showDialog(
          //                               context: context, child: warning);
          //                         },
          //                       ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          
          // ),
        
        ],
      ),
    );
  }
}
