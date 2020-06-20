import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './constants.dart';
import 'camera.dart';



import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';



class DriverRegistration extends StatefulWidget {
  final String imagePath;

  const DriverRegistration([this.imagePath]);
  @override
  _DriverRegistrationState createState() => _DriverRegistrationState();
}

class _DriverRegistrationState extends State<DriverRegistration> {
  final controller = PageController(viewportFraction: 1);
  String carType;
  String carPlateNo;
  String carColor;
  String emptySeats;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      // backgroundColor: Colors.grey.shade300,
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
      body: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 550,
                child: PageView(
                  controller: controller,
                  children: [
                    Container(
                        // width: 300,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '1.TIME TO TAKE A SELFIE',
                                    // textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Your selfie helps identifies you to your riders. It is used to verify you as an active user in WeShare platform.',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DottedBorder(
                              borderType: BorderType.RRect,
                              dashPattern: [6, 6, 6, 6],
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              child: Container(
                                  height: 200,
                                  width: 320,
                                  // color: Colors.amber,
                                  child: widget.imagePath == null ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      SizedBox(height: 0),
                                      Container(
                                        height: 70,
                                        child: Image.asset(
                                          'assets/selfie.png',
                                        ),
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          Navigator.push( context,
                                              new MaterialPageRoute( builder:(BuildContext context) =>
                                                          new CamerScreen())
                                          );
                                        },
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 90, minHeight: 0.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Snap',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              // fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],

                                  )
                            :Image.file(File(widget.imagePath)),
                                  ),
                            )
                          ],
                        )),
                    Container(
                        // width: 300,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '2. SNAP YOUR IDENTITY PROOF',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Identity proof can be the Identity Card or passport preface only. Military Identity Card, Student Card, Insurance Card are not accepted.',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DottedBorder(
                              borderType: BorderType.RRect,
                              dashPattern: [6, 6, 6, 6],
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              child: Container(
                                  height: 200,
                                  width: 320,
                                  // color: Colors.amber,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      SizedBox(height: 0),
                                      Container(
                                        height: 55,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/passport.png',
                                            ),
                                            Image.asset(
                                              'assets/id.png',
                                            ),
                                          ],
                                        ),
                                      ),
                                      RaisedButton(
                                        onPressed: () {},
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 90, minHeight: 0.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Snap',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              // fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        )),
                    Container(
                        // width: 300,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '3. SNAP YOUR DRIVING LICENSE',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Make sure your driving license is valid. Your driving license proves that you are eligible to drive and let us assure that our riders are safe on the road.',
                                    // textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DottedBorder(
                              borderType: BorderType.RRect,
                              dashPattern: [6, 6, 6, 6],
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              child: Container(
                                  height: 200,
                                  width: 320,
                                  // color: Colors.amber,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      SizedBox(height: 0),
                                      Container(
                                        height: 70,
                                        child: Image.asset(
                                          'assets/license.png',
                                        ),
                                      ),
                                      RaisedButton(
                                        onPressed: () {},
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 90, minHeight: 0.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Snap',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              // fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        )),
                    Container(
                        // width: 300,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '4. ENTER YOUR CAR DETAILS',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Ensure that all car details are correct. This information will assist your riders to find you easier and faster.',
                                    // textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Car Type:',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14.0)),
                                  Material(
                                    elevation: 2.0,
                                    shadowColor: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: TextFormField(
                                      decoration: textInputDecoration,
                                      validator: (type) => type.isEmpty
                                          ? 'Field Required!'
                                          : null,
                                      onSaved: (newType) {
                                        carType = newType;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Car Plate No.:',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14.0)),
                                  Material(
                                    elevation: 2.0,
                                    shadowColor: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: TextFormField(
                                      decoration: textInputDecoration,
                                      validator: (type) => type.isEmpty
                                          ? 'Field Required!'
                                          : null,
                                      onSaved: (newCarNo) {
                                        carPlateNo = newCarNo;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 170,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Car Color:',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14.0)),
                                            Material(
                                              elevation: 2.0,
                                              shadowColor: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              child: TextFormField(
                                                decoration: textInputDecoration,
                                                validator: (type) =>
                                                    type.isEmpty
                                                        ? 'Field Required!'
                                                        : null,
                                                onSaved: (newCarColor) {
                                                  carColor = newCarColor;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Car Empty Seats:',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14.0)),
                                              Material(
                                                elevation: 2.0,
                                                shadowColor: Colors.black,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                child: TextFormField(
                                                  decoration:
                                                      textInputDecoration,
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (type) =>
                                                      type.isEmpty
                                                          ? 'Field Required!'
                                                          : null,
                                                  onSaved: (newCarSeatsNo) {
                                                    emptySeats = newCarSeatsNo;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //     height:
                            //         MediaQuery.of(context).size.height / 5.5),
                            // Container(
                            //   //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            //   child: FlatButton(
                            //     child: Text(
                            //       'Save Changes',
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 17),
                            //     ),
                            //     onPressed: () {
                            //       _saveForm();
                            //     },
                            //     color: Color(0xFF5C79FF),
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius:
                            //             new BorderRadius.circular(12)),
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 110, vertical: 20),
                            //   ),
                            // ),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 4,
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () async {},
                color: Colors.white,
                // elevation: 0.0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).accentColor, width: 2.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 320.0, minHeight: 60.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
