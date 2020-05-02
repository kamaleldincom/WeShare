/*                                This page is dedicated for the drivers to start and their rides
                                   end their rides when dropping off the rider(Only Driver Side)
*/
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class StartEndRideInterface extends StatefulWidget {
  @override
  _StartEndRideInterfaceState createState() => _StartEndRideInterfaceState();
}

class _StartEndRideInterfaceState extends State<StartEndRideInterface> {
  bool rideStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color(0xFF5C79FF),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
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
                          borderRadius: BorderRadius.circular(10.0)),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 12, right: 25),
                        leading: Column(
                          children: <Widget>[
                            Text(
                              'Chat',
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 11.5),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 5),
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/driver.png'),
                              radius: 13,
                            ),
                          ],
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
                      ),
                    ),
                  ),

                  //! Trip Card
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 17),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 1,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Row(
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
                                          'Desa Skudai Apartments',
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
                                          'Electrical (FKE) P05',
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
                              SizedBox(
                                width: 35,
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 55,
                                          child: MaterialButton(
                                            onPressed: () {},
                                            color: Colors.redAccent,
                                            textColor: Colors.white,
                                            child: Icon(
                                              Icons.phone,
                                              size: 20,
                                            ),
                                            padding: EdgeInsets.all(5),
                                            shape: CircleBorder(),
                                          ),
                                        ),
                                        Container(
                                          width: 55,
                                          child: MaterialButton(
                                            onPressed: () {},
                                            color: Colors.blue[300],
                                            textColor: Colors.white,
                                            child: Icon(
                                              Icons.more_horiz,
                                              size: 20,
                                            ),
                                            padding: EdgeInsets.all(5),
                                            shape: CircleBorder(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      color: Colors.black,
                                      child: Text(
                                        'EDIT POINTS',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              )
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
                                      onPressed: () {},
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
                                            onPressed: () {},
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
