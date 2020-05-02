import 'package:flutter/material.dart';

class Ride extends StatefulWidget {
  @override
  _RideState createState() => _RideState();
}

class _RideState extends State<Ride> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Positioned(
            bottom: 48.0,
            left: 10.0,
            right: 10.0,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
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
                    child: ListTile(
                      leading: Container(
                        height: 70,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue[300],
                          child: Text(
                            '+1',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // leading: Stack(children: <Widget>[
                      //   Positioned(
                      //     bottom: 48.0,
                      //     left: 10.0,
                      //     right: 10.0,
                      //     child: Row(),
                      //   ),
                      // ]),
                      title: Text(
                        '7:43 AM',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: Text(
                        'You: Be in front of the gate guys',
                        style: TextStyle(
                          // fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 26,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).accentColor,
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    height: 52,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(0),
                              height: 16,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 16,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(' Electrical (FKE) P05'),
                            Text(' Electrical (FKE) P05'),
                          ],
                        ),
                        SizedBox(
                          width: 80,
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
          ),
        ],
      ),
    );
  }
}
