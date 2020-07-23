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
      body: Container(
        // color: Colors.blue,
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            // MAP GOES HERE
            
            //! Chat Info.
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              left: 0,
              right: 0,
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
                                alignment: Alignment.topLeft,
                                width: 200,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
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
                                          Icons.fiber_manual_record,
                                          size: 22,
                                        ),
                                        Text(
                                          '${ride.from}',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
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
                                          Icons.radio_button_checked,
                                          size: 22,
                                        ),
                                        Text(
                                          '${ride.to}',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              rideStarted
                                  ? Container()
                                  : Text(
                                      'Ride at 1:15 PM',
                                      style: TextStyle(color: Colors.grey),
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
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        DatabaseService()
                                            .endRide(ride, user.uid);
                                      },
                                    )
                                  : FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      color: Colors.green[400],
                                      child: Text('START RIDE',
                                          style:
                                              TextStyle(color: Colors.white)),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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
      ),
    );
  }
}
