import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/services/database.dart';
import 'package:weshare_main/weshare_icons.dart';

import 'constants.dart';
import 'myappbar.dart';
import 'myflexiableappbar.dart';

class Dashboard extends StatefulWidget {
  BuildContext context;
  // Dashboard(this.context);
  // Dashboard(List<Ride> rides,this.context);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context) ?? null;
    // final rides = Provider.of<List<Ride>>(widget.context);
    return StreamProvider<List<Ride>>.value(
      value: DatabaseService().rides,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          key: _scaffold,
          backgroundColor: Color(0xFFF1F3F5),
          // appBar: AppBar(
          //   brightness: Brightness.light,
          //   automaticallyImplyLeading: false,
          // backgroundColor: Color(0xFFF1F3F5),
          // title: Text(
          //   'WeShare',
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontWeight: FontWeight.w600,
          //   ),
          //   ),
          //   elevation: 0.0,
          //   centerTitle: true,
          //   actions: <Widget>[

          //   ],

          // ),
          body: CustomScrollView(
            slivers: <Widget>[
              ///////////////
              // SliverAppBar //
              ///////////////
              SliverAppBar(
                automaticallyImplyLeading: false,
                brightness: Brightness.dark,
                title: MyAppBar(),
                pinned: false,
                floating: true,
                expandedHeight: 280,
                flexibleSpace: FlexibleSpaceBar(
                  background: MyFlexiableAppBar(),
                ),
              ),
              ///////////////
              // SliverList //
              ///////////////
              RidesSliverList(scaffold:  _scaffold),
            ],
          ),
          // bottomNavigationBar: BtmNavBar(),
        ),
      ),
    );
  }
}

class RidesSliverList extends StatefulWidget {
  final scaffold;
  const RidesSliverList({
    this.scaffold,
    Key key,
  }) : super(key: key);

  @override
  _RidesSliverListState createState() => _RidesSliverListState();
}

class _RidesSliverListState extends State<RidesSliverList> {
  DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    final rides = Provider.of<List<Ride>>(context) ?? [];
    User user = Provider.of<User>(context) ?? [];

    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, index) {
        String dateTime = rides[index].dateTime ?? " ";
        var characterIndex = dateTime.indexOf(" ");
        var date = dateTime.substring(0, characterIndex);
        var time = dateTime.substring(characterIndex);

        return Container(
          height: 210,
          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          // color: Colors.orange[100*(index%9)],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ///////////////
              // DriverInfo //
              ///////////////
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      radius: 22,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 21.5,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/person1.jpeg'),
                          radius: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Title(
                            color: Colors.black,
                            child: Text(
                              '${rides[index].driver.name}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            // '13h ago',
                            '${rides[index].dateAdded}',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ///////////////
              // RideDetails //
              ///////////////
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Title(
                                  color: Colors.black,
                                  child: Text(
                                    'Pickup at',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '${time}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Text(
                                  '${date}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      SizedBox(width: 10),
                                      Container(
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
                                              '${rides[index].from}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ],
                                          // brightness_1
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
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
                                      SizedBox(width: 10),
                                      Container(
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
                                              '${rides[index].to}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: Colors.grey,
                                              ),
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
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Title(
                            color: Colors.black,
                            child: Text(
                              'Available Seats',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${rides[index].availableSeats}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ///////////////
              // FocusData  + Join//
              ///////////////
              Container(
                padding: EdgeInsets.all(10),
                height: 55,
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            '${rides[index].price}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///////////////
                    // Join btn //
                    ///////////////
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      // padding: EdgeInsets.all(5),
                      onPressed: () {
                        ///////////////
                        // PopUp Dialog //
                        ///////////////
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  height: 500,
                                  decoration: BoxDecoration(),
                                  // margin: EdgeInsets.symmetric(horizontal:15,),
                                  // padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ///////////////
                                      // route Map //
                                      ///////////////
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height: 250,
                                        // width: 350,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.grey,
                                            )),
                                      ),
                                      ///////////////
                                      // Ride and Driver Details //
                                      ///////////////
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            ///////////////
                                            // Driver //
                                            ///////////////
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .accentColor,
                                                    radius: 22,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 21.5,
                                                      child: CircleAvatar(
                                                        backgroundImage: AssetImage(
                                                            'assets/person1.jpeg'),
                                                        radius: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  Title(
                                                    color: Colors.black,
                                                    child: Text(
                                                      'Ali Qasmi',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ///////////////
                                            // Ride //
                                            ///////////////
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Title(
                                                        color: Colors.black,
                                                        child: Text(
                                                          'Pickup at',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 11,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                      Text(
                                                        '7:45 AM',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                          color:
                                                              Colors.grey[700],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons.trip_origin,
                                                              color: Theme.of(
                                                                      context)
                                                                  .accentColor,
                                                              size: 15,
                                                            ),
                                                            SizedBox(width: 3),
                                                            Container(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Title(
                                                                    color: Colors
                                                                        .black,
                                                                    child: Text(
                                                                      'From',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontSize:
                                                                            11,
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Desa Skudai Apartments',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                              .grey[
                                                                          800],
                                                                    ),
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
                                                        margin:
                                                            EdgeInsets.all(0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .brightness_1,
                                                              color: Theme.of(
                                                                      context)
                                                                  .accentColor,
                                                              size: 15,
                                                            ),
                                                            SizedBox(width: 3),
                                                            Container(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Title(
                                                                    color: Colors
                                                                        .black,
                                                                    child: Text(
                                                                      'To',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontSize:
                                                                            11,
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'school of Electrical (P05)',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          13,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      ///////////////
                                      // focus Data + Join //
                                      ///////////////
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF9F9F9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'MYR',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    '1.50',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 22,
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Ride ride = rides[index];
                                                if (databaseService.hasJoined(
                                                    ride.riders, user.uid)) {
                                                      Navigator.pop(context);
                                                  SnackBar registrationBar = SnackBar(
                                                    content: Text(
                                                      'Sorry, You joined this ride!',
                                                    ),
                                                  );
                                                widget.scaffold.currentState.showSnackBar(registrationBar);
                                                } else {
                                                  print(
                                                      'ride id : ${ride.rid}');
                                                  databaseService.joinRide(
                                                      ride, user);
                                                  Navigator.pop(context);
                                                }
                                              },
                                              color:
                                                  Theme.of(context).accentColor,
                                              child: Text(
                                                'Join Ride',
                                                style: TextStyle(
                                                  fontSize: 19.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        7.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Text(
                        'Join',
                        style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(7.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      childCount: rides.length,
    ));
  }
}
