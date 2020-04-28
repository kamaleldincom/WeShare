import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

import './constants.dart';

class ProvideRide extends StatefulWidget {
  @override
  _ProvideRideState createState() => _ProvideRideState();
}

class _ProvideRideState extends State<ProvideRide> {
  String origin; //holds starting point
  String destination; //holds destination point

  FocusNode originFocusNode = FocusNode();
  FocusNode destinationFocusNode = FocusNode();

  DateTime selectedDate;
  DateTime selectedTime;
  final DateFormat date = DateFormat('dd-MM-yyyy');
  final DateFormat time = DateFormat('hh:mm a');

  String tripDate; //holds trip date
  String tripTime; //holds trip time

  int dropDownValue; //holds seats available

  bool femaleBoxValue = false;
  bool normalBoxValue = false;

  String gender; //holds the gender

  String tripFare = '0';
  double tripFares = 0;

  bool keyboardOpen = false;

  String notes;

  void initState() {
    super.initState();
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
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFF1F3F5),
      appBar: appBarBuilder('Provide', true, null),
      body: SingleChildScrollView(
        //padding: EdgeInsets.only(bottom: 40.0), //here
        child: Column(
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
                                'From',
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
                                      _fieldFocusChange(
                                          context, originFocusNode);
                                      print('FROM: ' +
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
                              Icon(Icons.radio_button_checked,
                                  color: Color(0xFF5C79FF), size: 23),
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
                                      fontSize: destinationFocusNode.hasFocus
                                          ? 19
                                          : 16,
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

            Container(
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
                      title: Wrap(
                        spacing: 12,
                        children: <Widget>[
                          Text('Choose Time', style: TextStyle(fontSize: 15)),
                          tripDate != null && tripTime != null
                              ? Icon(
                                  Icons.check_circle,
                                  size: 16,
                                  color: Color(0xFF5C79FF),
                                )
                              : Icon(null),
                        ],
                      ),

                      leading: Icon(
                        Icons.access_time,
                        color: Color(0xFF5C79FF),
                      ),
                      // trailing:
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                    selectedDate == null
                                        ? 'Date Not Chosen!'
                                        : tripDate,
                                    style: TextStyle(
                                      color: selectedDate == null
                                          ? Colors.black
                                          : Colors.green,
                                      fontWeight: selectedDate == null
                                          ? FontWeight.normal
                                          : FontWeight.bold,
                                      fontSize: selectedDate == null ? 13 : 15,
                                    )),
                                Text(
                                  selectedTime == null
                                      ? 'Time Not Chosen!'
                                      : tripTime,
                                  style: TextStyle(
                                    color: selectedTime == null
                                        ? Colors.black
                                        : Colors.green,
                                    fontWeight: selectedTime == null
                                        ? FontWeight.normal
                                        : FontWeight.bold,
                                    fontSize: selectedDate == null ? 13 : 15,
                                  ),
                                ),
                              ],
                            ),
                            RaisedButton(
                              child: Text(
                                'Choose Date and Time',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () async {
                                final selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now()
                                        .add(Duration(seconds: 1)),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100));
                                if (selectedDate == null) return;

                                final selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(
                                        hour: DateTime.now().hour,
                                        minute: DateTime.now().minute));
                                if (selectedTime == null) return;

                                // to convert Time (type: TimeOfDay) to String
                                String formatTimeOfDay(TimeOfDay tod) {
                                  final now = new DateTime.now();
                                  final dt = DateTime(now.year, now.month,
                                      now.day, tod.hour, tod.minute);
                                  final format = DateFormat.jm();
                                  return format.format(dt);
                                }

                                this.tripDate = date.format(selectedDate);
                                this.tripTime = formatTimeOfDay(selectedTime);

                                setState(() {
                                  this.selectedDate = DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    selectedTime.hour,
                                    selectedTime.minute,
                                  );
                                  this.selectedTime = DateTime(
                                    selectedTime.hour,
                                    selectedTime.minute,
                                  );

                                  this.tripDate = date.format(selectedDate);
                                  this.tripTime = formatTimeOfDay(selectedTime);
                                  print(this.tripDate);
                                  print(this.tripTime);
                                });
                              },
                              //color: Color(0xFF5C79FF),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    //! seats
                    ExpansionTile(
                      title: Wrap(
                        spacing: 12,
                        children: <Widget>[
                          Text('Enter No. of Seats Available',
                              style: TextStyle(fontSize: 14)),
                          dropDownValue != null
                              ? Icon(
                                  Icons.check_circle,
                                  size: 16,
                                  color: Color(0xFF5C79FF),
                                )
                              : Icon(null),
                        ],
                      ),
                      leading: Icon(
                        Icons.event_seat,
                        color: Color(0xFF5C79FF),
                      ),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('Number of Seats: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            DropdownButton<int>(
                              value: dropDownValue,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 32,
                              elevation: 16,
                              style: TextStyle(color: Color(0xFF5C79FF)),
                              underline: Container(
                                height: 3,
                                color: Color(0xFF5C79FF),
                              ),
                              onChanged: (int newValue) {
                                setState(() {
                                  dropDownValue = newValue;
                                });
                              },
                              items: <int>[
                                1,
                                2,
                                3,
                                4,
                                5,
                              ].map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //! gender
                    ExpansionTile(
                      title: Wrap(
                        spacing: 12,
                        children: <Widget>[
                          Text('Choose Riders Gender',
                              style: TextStyle(fontSize: 15)),
                          gender != null
                              ? Icon(
                                  Icons.check_circle,
                                  size: 16,
                                  color: Color(0xFF5C79FF),
                                )
                              : Icon(null),
                        ],
                      ),
                      leading: Icon(
                        Icons.people,
                        color: Color(0xFF5C79FF),
                      ),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                                value: femaleBoxValue,
                                onChanged: (bool value) {
                                  setState(() {
                                    femaleBoxValue = value;
                                    if (femaleBoxValue) {
                                      normalBoxValue = false;
                                      gender = 'female';
                                    }
                                  });
                                }),
                            Text('Females Only'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                                value: normalBoxValue,
                                onChanged: (bool value) {
                                  setState(() {
                                    normalBoxValue = value;
                                    if (normalBoxValue) {
                                      femaleBoxValue = false;
                                      gender = 'normal';
                                    }
                                  });
                                }),
                            Text('Normal Mode'),
                          ],
                        ),
                      ],
                    ),

                    //! price
                    ExpansionTile(
                      title: Wrap(
                        spacing: 12,
                        children: <Widget>[
                          Text('Enter Ride Price per Rider',
                              style: TextStyle(fontSize: 15)),
                          tripFares != 0 && tripFare != null
                              ? Icon(
                                  Icons.check_circle,
                                  size: 16,
                                  color: Color(0xFF5C79FF),
                                )
                              : Icon(null),
                        ],
                      ),
                      leading: Icon(
                        Icons.attach_money,
                        color: Color(0xFF5C79FF),
                      ),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'RM ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  width: 130,
                                  height: 60,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.red,
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) => setState(() {
                                      tripFare = value;
                                      tripFares = double.parse(tripFare);
                                    }),
                                  ),
                                ),
                              ],
                            ),

                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: <Widget>[
                            //     Text('Your fare:'),
                            //     Text(tripFare,
                            //         style: TextStyle(
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 20)),
                            //   ],
                            // ),
                          ],
                        ),
                        SizedBox(
                            height: tripFares > 5 ? 50 : 25,
                            child: tripFares > 5
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.lightbulb_outline,
                                          color: Colors.yellow),
                                      Text(
                                          'The lower the price, the faster you find riders!',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                          textAlign: TextAlign.center),
                                    ],
                                  )
                                : null),
                      ],
                    ),
                    //! note
                    ExpansionTile(
                      title: Wrap(
                        spacing: 12,
                        children: <Widget>[
                          Text('Add a Note', style: TextStyle(fontSize: 15)),
                          notes != null
                              ? Icon(
                                  Icons.check_circle,
                                  size: 16,
                                  color: Color(0xFF5C79FF),
                                )
                              : Icon(null),
                        ],
                      ),
                      leading: Icon(
                        Icons.comment,
                        color: Color(0xFF5C79FF),
                      ),
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                              child: Container(
                                width: 330,
                                height: 130,
                                decoration: new BoxDecoration(
                                    color: Color(0xFFF1F3F5),
                                    border: new Border.all(
                                        color: Color(0xFFF1F3F5)),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: <Widget>[
                                    TextField(
                                      // textAlign: TextAlign.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        fillColor: Colors.red,
                                        contentPadding: EdgeInsets.all(10),
                                        border: InputBorder.none,
                                        hintText: 'Any Notes?',
                                        hintStyle: TextStyle(fontSize: 14),
                                      ),

                                      onChanged: (value) => setState(() {
                                        notes = value;
                                        print(notes);
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Align(
              // alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FlatButton(
                  child: Text(
                    'Post Ride',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  onPressed: () {
                    print(keyboardOpen);
                  },
                  color: Color(0xFF5C79FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      //floatingActionButton:
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
