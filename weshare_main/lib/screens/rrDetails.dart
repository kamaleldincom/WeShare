import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class RrDetails extends StatefulWidget {
  @override
  _RrDetailsState createState() => _RrDetailsState();
}

class _RrDetailsState extends State<RrDetails> {
  @override
  Widget build(BuildContext context) {
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
                    child:Column(
                        children: <Widget>[
                  Container(
                    height: 100,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 70,
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                              Text(
                                'Ali Qasmi',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    // height: 52,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: <Widget>[
                        Container(
                                // padding: EdgeInsets.only(left: 10),
                                // alignment: Alignment.topLeft,
                                // width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Icons.trip_origin,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 5,),
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
                                      height: 5,
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
                                          Icons.brightness_1,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 5,),
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
                        FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Colors.greenAccent[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: FlatButton(
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                      onPressed: () {},
                      color: Colors.grey,
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 320.0, minHeight: 45),
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
