import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weshare_main/screens/Profile.dart';
import './constants.dart';
import 'camera.dart';
import 'dart:io';

class DriverRegistration extends StatefulWidget {
   
  int index = 0;
  DriverRegistration(this.index);

  @override
  _DriverRegistrationState createState() => _DriverRegistrationState();
}

class _DriverRegistrationState extends State<DriverRegistration> {
  String selfiePath;
   String idPath;
   String licensePath;



  var controller = PageController(viewportFraction: 1, initialPage: 0);
  var currentPageValue = 0;
  String carType;
  String carPlateNo;
  String carColor;
  String emptySeats;

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
    List<Container> pages = [
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
                      '1. TIME TO TAKE A SELFIE',
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
                        fontSize: 16.5,
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
                  child: selfiePath == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(height: 0),
                            Container(
                              height: 70,
                              child: Image.asset(
                                'assets/selfie.png',
                              ),
                            ),
                            RaisedButton(
                              onPressed: () async {
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             new CamerScreen(0,true)));

                                selfiePath = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CamerScreen(0, true)),
                                );
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
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
                      : Image.file(File(selfiePath)),
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
                        fontSize: 16.5,
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
                  child: idPath == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(height: 0),
                            Container(
                              height: 55,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                              onPressed: () async {
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             new CamerScreen(1, true)));
                                idPath = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CamerScreen(1, false)));
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
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
                      : Image.file(File(idPath)),
                ),
              )
            ],
          )),
      Container(
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
                        fontSize: 16.5,
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
                  child: licensePath == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(height: 0),
                            Container(
                              height: 70,
                              child: Image.asset(
                                'assets/license.png',
                              ),
                            ),
                            RaisedButton(
                              onPressed: () async {
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             new CamerScreen(2,false)));

                                licensePath = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CamerScreen(2, false)),
                                );
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
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
                      : Image.file(File(licensePath)),
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
                        fontSize: 16.5,
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
                        style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                    Material(
                      elevation: 2.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: TextFormField(
                        decoration: textInputDecoration,
                        validator: (type) =>
                            type.isEmpty ? 'Field Required!' : null,
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
                        style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                    Material(
                      elevation: 2.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: TextFormField(
                        decoration: textInputDecoration,
                        validator: (type) =>
                            type.isEmpty ? 'Field Required!' : null,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Car Color:',
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
                                  validator: (type) =>
                                      type.isEmpty ? 'Field Required!' : null,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Car Empty Seats:',
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
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    validator: (type) =>
                                        type.isEmpty ? 'Field Required!' : null,
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
    ];

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Color(0xFF5C79FF),
        ),
        elevation: 0,
        centerTitle: true,
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
                  onPageChanged: (index) {
                    setState(() {
                      widget.index = index;
                    });
                  },
                  controller: controller,
                  children: pages,
                ),
              ),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    //dotColor:  Theme.of(context).accentColor,
                    activeDotColor: Theme.of(context).accentColor,
                    expansionFactor: 4,
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
              ),
              widget.index < 3
                  ? FlatButton(
                      onPressed: () async {
                        setState(() {
                          controller.animateToPage(widget.index + 1,
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 700));
                          widget.index++;
                        });
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Theme.of(context).accentColor, width: 2.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 310.0, minHeight: 60.0),
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
                    )
                  : FlatButton(
                      onPressed: () async {
                        AlertDialog warning = AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          title: Image.asset(
                            'assets/confused.png',
                            height: 110,
                          ),
                          content: Container(
                            height: 300,
                            child: Column(
                              children: <Widget>[
                                Text('HORAAY!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(height: 25),
                                Text(
                                    'We have received your application. However, we still need some time to verify the documents and information you just sent to us.',
                                    style: TextStyle()),
                                SizedBox(height: 20),
                                Text(
                                    'Sit back and relax, we\'ll get back to you within couple of days..',
                                    style: TextStyle()),
                                SizedBox(height: 50),
                                FlatButton(
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                        // fontFamily: 'SegoeUI',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  onPressed: () {
                                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Profile('Rider')), (Route<dynamic> route) => false);
                                  },
                                  color: Theme.of(context).accentColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(12)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 123, vertical: 18),
                                ),
                              ],
                            ),
                          ),
                        );
                        showDialog(context: context, child: warning);
                      },
                      child: buttonWithGradient('Submit!', 350),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
