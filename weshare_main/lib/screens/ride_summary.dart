import 'package:flutter/material.dart';

import 'constants.dart';

class RideSummary extends StatefulWidget {
  @override
  _RideSummaryState createState() => _RideSummaryState();
}

class _RideSummaryState extends State<RideSummary> {
  @override
  Widget build(BuildContext context) {
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
            height: 150.0,
            decoration: BoxDecoration(
              gradient: linearGradientvertical,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                    radius: 45.0,
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
                          fontWeight: FontWeight.bold,
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
              margin: EdgeInsets.symmetric(horizontal: 10),
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
                      Container(
                        margin: EdgeInsets.all(10),
                        // padding: EdgeInsets.symmetric(vertical: ),

                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                                Icons.trip_origin,
                                                color: Color(0xFF686868),
                                                size: 15,
                                              ),
                                    SizedBox(height: 20),
                                    Icon(
                                                Icons.brightness_1,
                                                color: Color(0xFF686868),
                                                size: 15,
                                              ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(' Electrical (FKE) P05'),
                                    Text(' Electrical (FKE) P05'),
                                  ],
                                ),
                              ],
                            ),
                            
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(' 10:10 AM',
                                    style: TextStyle(color: Colors.grey)),
                                Text(' 10:20 AM',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                        child: Text(
                          'Riders',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
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
                              '4 km . 17mins',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
                        height: 65,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Total',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    )),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('RM 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    )),
                                Row(
                                  children: <Widget>[
                                    Text('cash',
                                        style: TextStyle(color: Colors.grey)),
                                    Icon(
                                      Icons.monetization_on,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        height: 65,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text('Carbon saved',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    )),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('0.05%',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    )),
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
