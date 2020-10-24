import 'package:flutter/material.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/services/database.dart';

import 'constants.dart';

class RideSummary extends StatefulWidget {
  @override
  _RideSummaryState createState() => _RideSummaryState();
}

class _RideSummaryState extends State<RideSummary> {
  CurrentRides ride;
  Map map = {};
  @override
  Widget build(BuildContext context) {
    ride = ModalRoute.of(context).settings.arguments;
    String dateTime = ride.dateTime ?? "";
    var characterIndex = dateTime.indexOf(" ");
    var date = dateTime.substring(0, characterIndex);
    var time = dateTime.substring(characterIndex);
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F5),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(0xFF76D3FF),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 140.0,
            decoration: BoxDecoration(
              gradient: linearGradientvertical,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40.0,
                    child: CircleAvatar(
                      child: FutureBuilder(
                          future: DatabaseService().getUserDetails(ride.did),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.photo) {
                                return FutureBuilder(
                                  future: DatabaseService().getImage(ride.did),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.done &&
                                        snapshot.hasData)
                                      return CircleAvatar(
                                        child: ClipOval(
                                          child: snapshot.data,
                                        ),
                                        // backgroundImage: NetworkImage(snapshot.data.preview),
                                        radius: 45,
                                      );

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting)
                                      return Container(
                                          child: Icon(Icons.person, size: 35));

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
                                Container(child: Icon(Icons.person, size: 35));
                              }
                            }
                            return Container(
                                child: Icon(Icons.person, size: 35));
                          }),
                      radius: 38.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: Center(
                    child: Column(children: <Widget>[
                      Text(
                        ride.driver.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10,),
              // padding: EdgeInsets.symmetric(vertical: 10,),
              child: Column(children: <Widget>[
                Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Container(
                      //   margin: EdgeInsets.all(10),
                      //   // padding: EdgeInsets.symmetric(vertical: ),

                      //   height: 150,
                      //   decoration: BoxDecoration(
                      //     color: Colors.blue,
                      //     borderRadius: BorderRadius.circular(8.0),
                      //   ),
                      // ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        // height: 52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    
                                    Icon(
                                      Icons.trip_origin,
                                      color: Theme.of(context).accentColor,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'from',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          ride.from,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.brightness_1,
                                      color: Theme.of(context).accentColor,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'To',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          ride.to,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    
                                  ],
                                ),
                              ],
                            ),
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('$time',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 5,),
                                Text('$date',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                      //   child: Text(
                      //     'Riders',
                      //     style: TextStyle(
                      //       color: Colors.grey,
                      //       fontSize: 14.0,
                      //     ),
                      //   ),
                      // ),
                      Divider(
                              color: Colors.grey.shade400,
                              indent: 10,
                              endIndent: 10,
                              height: 10,
                            ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              'Riders',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Text(
                                  '4km . 17mins',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    // fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // height: 80,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Total',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('${ride.price}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    )),
                                
                                SizedBox(width: 5,),
                                Text('MYR',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                    
                                ),
                                // Icon(
                                //   Icons.monetization_on,
                                //   color: Colors.grey,
                                //   size: 20,
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Builder(builder: (context) {
                  return Container(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.grey[100],
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[600], width: 2.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 350.0, minHeight: 60.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Report An Issue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ])),
        ],
      ),
    );
  }
}
