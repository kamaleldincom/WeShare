import 'package:flutter/material.dart';
import 'dart:ui';
import './constants.dart';
import 'constants.dart';

class ProvideRide extends StatefulWidget {
  @override
  _ProvideRideState createState() => _ProvideRideState();
}

class _ProvideRideState extends State<ProvideRide> {
  String origin;
  String destination;
  FocusNode originFocusNode = FocusNode();
  FocusNode destinationFocusNode = FocusNode();

  void initState() {
    setState(() {
      super.initState();
      originFocusNode = FocusNode();
      destinationFocusNode = FocusNode();
    });
  }

  @override
  void dispose() {
    originFocusNode.dispose();
    destinationFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F5),
      appBar: appBarBuilder('Provide', true, null),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  //! first input
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 10,
                      bottom: 0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.fiber_manual_record,
                              color: Color(0xFF5C79FF),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'from',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Color(0xFFF1F3F5),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFormField(
                                focusNode: originFocusNode,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Find me at...',
                                  hintStyle: TextStyle(
                                    fontSize:
                                        originFocusNode.hasFocus ? 19 : 16,
                                    fontWeight: originFocusNode.hasFocus
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                  contentPadding: EdgeInsets.only(right: 45),
                                ),
                                validator: (value) => value.isEmpty
                                    ? 'Enter your meeting point'
                                    : null,
                                onEditingComplete: () => setState(() {}),
                                onChanged: (value) => setState(() {
                                  origin = value;
                                }),
                                onTap: () {
                                  setState(() {
                                    //originFocusNode.unfocus();
                                    _fieldFocusChange(context, originFocusNode);
                                    print('TO: ' +
                                        originFocusNode.hasFocus.toString());
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 0),

                  //! Second input

                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 10,
                      bottom: 0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Color(0xFF5C79FF),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'To',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Color(0xFFF1F3F5),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFormField(
                                focusNode: destinationFocusNode,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'I\'m going to...',
                                  hintStyle: TextStyle(
                                    fontSize:
                                        destinationFocusNode.hasFocus ? 19 : 16,
                                    fontWeight: destinationFocusNode.hasFocus
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                  contentPadding: EdgeInsets.only(right: 45),
                                ),
                                validator: (value) => value.isEmpty
                                    ? 'Enter your destination'
                                    : null,
                                onChanged: (value) => setState(() {
                                  destination = value;
                                }),
                                onTap: () {
                                  setState(() {
                                    //originFocusNode.unfocus();
                                    _fieldFocusChange(
                                        context, destinationFocusNode);
                                    print('TO: ' +
                                        destinationFocusNode.hasFocus
                                            .toString());
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //! other options
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
                child: Column(
                  children: <Widget>[
                    //! time
                    ExpansionTile(
                      title: Text('Choose Time'),
                      leading: Icon(
                        Icons.access_time,
                        color: Color(0xFF5C79FF),
                      ),
                      children: <Widget>[
                        Text('I go here'),
                      ],
                    ),
                    //! seats
                    ExpansionTile(
                      title: Text('Enter No. of Seats Available'),
                      leading: Icon(
                        Icons.event_seat,
                        color: Color(0xFF5C79FF),
                      ),
                      children: <Widget>[
                        Text('I go here'),
                      ],
                    ),
                    //! gender
                    ExpansionTile(
                      title: Text(
                        'Choose Riders Gender',
                      ),
                      leading: Icon(
                        Icons.people,
                        color: Color(0xFF5C79FF),
                      ),
                      children: <Widget>[
                        Text('I go here'),
                      ],
                    ),
                    //! price
                    ExpansionTile(
                      title: Text('Enter Ride Price per Rider'),
                      leading: Icon(
                        Icons.attach_money,
                        color: Color(0xFF5C79FF),
                      ),
                      children: <Widget>[
                        Text('I go here'),
                      ],
                    ),
                    //! note
                    ExpansionTile(
                      title: Text('Add a Note'),
                      leading: Icon(
                        Icons.comment,
                        color: Color(0xFF5C79FF),
                      ),
                      children: <Widget>[
                        Text('I go here'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_fieldFocusChange(BuildContext context, FocusNode currentFocus) {
  //nextFocus.unfocus();
  FocusScope.of(context).requestFocus(currentFocus);
}

// IconButton(
//                                   icon: Icon(Icons.cancel),
//                                   onPressed: () {
//                                     setState(() {});
//                                   }),

// ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   itemBuilder: (BuildContext context, int index) =>
//                       ,
//                   itemCount: 3,
//                 ),
