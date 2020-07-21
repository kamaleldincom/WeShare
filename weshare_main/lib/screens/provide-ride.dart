import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/services/database.dart';

import './constants.dart';

class ProvideRide extends StatefulWidget {
  @override
  _ProvideRideState createState() => _ProvideRideState();
}

class _ProvideRideState extends State<ProvideRide> {
  String origin; //holds starting point
  String destination; //holds destination point

  final originHolder = TextEditingController();
  final destinationHolder = TextEditingController();

  FocusNode originFocusNode = FocusNode();
  FocusNode destinationFocusNode = FocusNode();

  DateTime selectedDate;
  DateTime selectedTime;
  final DateFormat date = DateFormat('yyyy-MM-dd');
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

  clearTextInput(textHolder) {
    textHolder.clear();
  }

  void initState() {
    super.initState();
    setState(() {
      super.initState();
      originFocusNode = FocusNode();
      destinationFocusNode = FocusNode();
    });
  }

  @override
  // void dispose() {
  //   originFocusNode.dispose();
  //   destinationFocusNode.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return FutureBuilder(
        future: DatabaseService().getUserDetails(user.uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data;
            return Scaffold(
              //resizeToAvoidBottomPadding: false,
              backgroundColor: Color(0xFFF1F3F5),
              appBar: appBarBuilder('Provide', true, null),
              body: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 50.0), //here
                child: Column(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                                      Icon(Icons.fiber_manual_record,
                                          color: Color(0xFF5C79FF),
                                          size: 23), //first icon
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'From',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
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
                                      SizedBox(
                                        width: 265,
                                        child: TextFormField(
                                          controller: originHolder, //controller
                                          focusNode: originFocusNode,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Find me at...',
                                            hintStyle: TextStyle(
                                              fontSize: originFocusNode.hasFocus
                                                  ? 19
                                                  : 16,
                                              fontWeight:
                                                  originFocusNode.hasFocus
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(right: 45),
                                          ),
                                          validator: (value) => value.isEmpty
                                              ? 'Enter your meeting point'
                                              : null,
                                          onChanged: (value) => setState(() {
                                            origin =
                                                value; //origin ^& destination
                                            print('value: $value');
                                          }),

                                          // onTap: () {
                                          //   setState(() {
                                          //     // widget.focus.unfocus();
                                          //     // _fieldFocusChange(context, widget.focus);
                                          //     // print('TO: ' + widget.focus.hasFocus.toString());
                                          //   });
                                          // },
                                        ),
                                      ),
                                      originHolder.text != ''
                                          ? IconButton(
                                              icon: Icon(Icons.cancel),
                                              onPressed: () {
                                                setState(() {
                                                  clearTextInput(originHolder);
                                                });
                                              },
                                              iconSize: 21,
                                              color: Color(0xFFE0E0E0),
                                            )
                                          : Icon(null),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //------------------------------------------------------

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
                                          color: Color(0xFF5C79FF),
                                          size: 23), //first icon
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'To',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
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
                                      SizedBox(
                                        width: 265,
                                        child: TextFormField(
                                          controller:
                                              destinationHolder, //controller
                                          focusNode: destinationFocusNode,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'I\'m going to...',
                                            hintStyle: TextStyle(
                                              fontSize:
                                                  destinationFocusNode.hasFocus
                                                      ? 19
                                                      : 16,
                                              fontWeight:
                                                  destinationFocusNode.hasFocus
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(right: 45),
                                          ),
                                          validator: (value) => value.isEmpty
                                              ? 'Enter your destination'
                                              : null,
                                          onChanged: (value) => setState(() {
                                            destination = value;
                                          }),

                                          // onTap: () {
                                          //   setState(() {
                                          //     // widget.focus.unfocus();
                                          //     // _fieldFocusChange(context, widget.focus);
                                          //     // print('TO: ' + widget.focus.hasFocus.toString());
                                          //   });
                                          // },
                                        ),
                                      ),
                                      destinationHolder.text != ''
                                          ? IconButton(
                                              icon: Icon(Icons.cancel),
                                              onPressed: () {
                                                setState(() {
                                                  clearTextInput(
                                                      destinationHolder);
                                                });
                                              },
                                              iconSize: 21,
                                              color: Color(0xFFE0E0E0),
                                            )
                                          : Icon(null),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //! Ride Registration Details

                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        child: Column(
                          children: <Widget>[
                            //! time & date

                            RideDetails(
                                'Choose Time',
                                tripDate != null && tripTime != null,
                                Icons.access_time, [
                              Column(
                                children: <Widget>[
                                  Row(
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
                                                fontSize: selectedDate == null
                                                    ? 13
                                                    : 15,
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
                                              fontSize: selectedDate == null
                                                  ? 13
                                                  : 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 40,
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
                                          final selectedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now()
                                                      .add(
                                                          Duration(seconds: 1)),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime(2100));
                                          if (selectedDate == null) return;

                                          final selectedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay(
                                                hour: DateTime.now().hour,
                                                minute: DateTime.now().minute),
                                          );
                                          if (selectedTime == null) return;

                                          // to convert Time (type: TimeOfDay) to String
                                          String formatTimeOfDay(
                                              TimeOfDay tod) {
                                            final now = new DateTime.now();
                                            final dt = DateTime(
                                                now.year,
                                                now.month,
                                                now.day,
                                                tod.hour,
                                                tod.minute);
                                            final format = DateFormat.jm();
                                            return format.format(dt);
                                          }

                                          this.tripDate =
                                              date.format(selectedDate);
                                          this.tripTime =
                                              formatTimeOfDay(selectedTime);

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

                                            this.tripDate =
                                                date.format(selectedDate);
                                            this.tripTime =
                                                formatTimeOfDay(selectedTime);
                                            print(this.tripDate);
                                            print(this.tripTime);
                                          });
                                        },
                                        //color: Color(0xFF5C79FF),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  )
                                ],
                              ),
                            ]),

                            //! seats

                            RideDetails(
                                'Enter No. of Seats Available',
                                dropDownValue != null,
                                Icons.event_seat,
                                [
                                  Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text('Number of Seats: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(width: 40),
                                          DropdownButton<int>(
                                            value: dropDownValue,
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconSize: 32,
                                            elevation: 16,
                                            style: TextStyle(
                                                color: Color(0xFF5C79FF)),
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
                                            ].map<DropdownMenuItem<int>>(
                                                (int value) {
                                              return DropdownMenuItem<int>(
                                                value: value,
                                                child: Text(value.toString()),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      )
                                    ],
                                  ),
                                ],
                                titleSize: 14),

                            //! gender

                            RideDetails('Choose Riders Gender', gender != null,
                                Icons.people, [
                              Column(
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
                            ]),

                            //! price

                            RideDetails(
                                'Enter Ride Price per Rider',
                                tripFares != 0 && tripFare != null,
                                Icons.attach_money, [
                              Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                fillColor: Colors.red,
                                                border: OutlineInputBorder(),
                                              ),
                                              onChanged: (value) =>
                                                  setState(() {
                                                tripFare = value;
                                                tripFares =
                                                    double.parse(tripFare);
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: tripFares > 5 ? 50 : 25,
                                      child: tripFares > 5
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.lightbulb_outline,
                                                    color: Colors.yellow),
                                                Text(
                                                    'The lower the price, the faster you find riders!',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                    textAlign:
                                                        TextAlign.center),
                                              ],
                                            )
                                          : null),
                                ],
                              ),
                            ]),

                            //! note

                            RideDetails(
                                'Add a Note', notes != null, Icons.comment, [
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 330,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF1F3F5),
                                          border: Border.all(
                                              color: Color(0xFFF1F3F5)),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: TextField(
                                        // textAlign: TextAlign.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        decoration: InputDecoration(
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
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13,
                                  )
                                ],
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: FlatButton(
                          child: Text(
                            'Post Ride',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          onPressed: () async {
                            // print();
                            // print(tripTime);
                            Ride ride = Ride(
                              did: user.uid,
                              availableSeats: dropDownValue,
                              from: origin,
                              to: destination,
                              riders: [],
                              dateTime: "$tripDate $tripTime",
                              price: tripFares,
                              note: notes,
                              status: 'posted',
                            );
                            print("from : $origin");
                            print("to : $destination");
                            await DatabaseService().provideRide(ride, user);

                            AlertDialog warning = AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              title: Image.asset(
                                'assets/confused.png',
                                height: 110,
                              ),
                              content: Container(
                                height: 170,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                          '✅ Your ride has been added successfully!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    SizedBox(height: 50),
                                    FlatButton(
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        BtnDriver()));
                                      },
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color:
                                                Theme.of(context).accentColor,
                                            width: 2.5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 310.0, minHeight: 60.0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'OK!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context, child: warning);
                          },
                          color: Color(0xFF5C79FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 140, vertical: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //floatingActionButton:
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

// _fieldFocusChange(BuildContext context, FocusNode currentFocus) {
//nextFocus.unfocus();
// FocusScope.of(context).requestFocus(currentFocus);
// }

class RideDetails extends StatefulWidget {
  final title;
  final double titleSize;
  final checklistCondition;
  final icon;
  final List<Widget> widgets;

  RideDetails(this.title, this.checklistCondition, this.icon, this.widgets,
      {this.titleSize});

  @override
  _RideDetailsState createState() => _RideDetailsState();
}

class _RideDetailsState extends State<RideDetails> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Wrap(
        spacing: 12,
        children: <Widget>[
          Text(widget.title,
              style: TextStyle(
                  fontSize: widget.titleSize != null ? widget.titleSize : 15)),
          widget.checklistCondition
              ? Icon(
                  Icons.check_circle,
                  size: 16,
                  color: Color(0xFF5C79FF),
                )
              : Icon(null),
        ],
      ),
      leading: Icon(
        widget.icon,
        color: Color(0xFF5C79FF),
      ),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.widgets,
        ),
      ],
    );
  }
}

// class RideLocation extends StatefulWidget {
//   final leadingIcon;
//   final leadingText;
//   final controllerHolder;
//   final focus;
//   final hint;
//   final errorMessage;
//   String locationName;

//   RideLocation(this.leadingIcon, this.leadingText, this.controllerHolder,
//       this.focus, this.hint, this.errorMessage, this.locationName);

//   @override
//   _RideLocationState createState() => _RideLocationState();
// }

// class _RideLocationState extends State<RideLocation> {
//   clearTextInput(textHolder) {
//     textHolder.clear();
//   }

//   @override
//   // void dispose() {
//   //   widget.focus.dispose();

//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
