// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/services/auth.dart';

import '../constants.dart';
import 'auth_consts.dart';

class SignUpStep1 extends StatefulWidget {
  User user;
  final next;
  SignUpStep1(this.next, [this.user]);

  @override
  _SignUpStep1State createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1> {
  AuthService auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // SizedBox(
                //   height: 40.0,
                // ),
                Container(
                    height: 330,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Full Name',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                        Material(
                          elevation: 2.0,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: TextFormField(
                            decoration: textInputDecoration,
                            validator: (val) =>
                                val.isEmpty ? 'Enter a name' : null,
                            onChanged: (val) {
                              setState(() => name = val);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Text('Email',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                        Material(
                          elevation: 2.0,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: TextFormField(
                            decoration: textInputDecoration,
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Text('Password',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                        Material(
                          elevation: 2.0,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: TextFormField(
                            decoration: textInputDecoration,
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ],
                    ) //SnackBar
                    ),
                Builder(builder: (context) {
                  return Container(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          // dynamic result = await auth.registerUser(email, password);
                          // print(result);
                          // if (result == null) {
                          //   setState(() {
                          //     error = 'please supply a valid email';
                          //   });
                          // }
                          widget.user.email = email;
                          widget.user.password = password;
                          widget.user.name = name;
                          widget.next();
                          // }
                        }
                      },
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Theme.of(context).accentColor, width: 2.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        constraints:
                            BoxConstraints(minHeight: 60.0),
                        width: MediaQuery.of(context).size.width,
                        
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
                  );
                }),
                SizedBox(height: 12.0),
                bottomSection('Already have an account?'),
              ],
            ),
          )),
    );
  }
}

//------------------------ Step 2 ------------------------ ------------------------

class SignUpStep2 extends StatefulWidget {
  final previous;
  User user;
  SignUpStep2(this.previous, this.user);
  @override
  _SignUpStep2State createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {
  AuthService auth = AuthService();

  String _gender;
  // String _genderResult;
  bool validNo = false;
  FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  List dataSource = [
    {
      "display": "Male",
      "value": "Male",
    },
    {
      "display": "Female",
      "value": "Female",
    },
  ];
  // print("user2: ${widget.user}");
  final _formKey = GlobalKey<FormState>();

  var error = '';
  void _setEerror() {
    setState(() {
      error = 'Plese choose gender';
      print(error);
    });
    // return error = 'Plese choose gender';
  }

// phone number dropdown ------------------------
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'MY';
  PhoneNumber number = PhoneNumber(isoCode: 'MY');

  // void getPhoneNumber(String phoneNumber) async {
  //   PhoneNumber number =
  //       await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');
  //   setState(() {
  //     this.number = number;
  //   });
  // }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
//------------------------ ------------------------ ------------------------

  @override
  Widget build(BuildContext context) {
    // print(widget.user);

    return SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Theme.of(context).accentColor,
                  iconSize: 30,
                  onPressed: () {
                    widget.previous();
                  },
                ),
                // SizedBox(
                //   height: 40.0,
                // ),
                Text('Phone Number',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0)
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    // height: 60,
                    constraints: BoxConstraints(minHeight: 60, maxHeight: 82),
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    child: InternationalPhoneNumberInput.withCustomDecoration(
                      // autoFocus: false,
                      inputDecoration: textInputDecoration,
                      onInputChanged: (PhoneNumber number) {
                        // print(number.phoneNumber);
                        widget.user.phoneNumber = number.phoneNumber;
                      },
                      onInputValidated: (bool value) {
                        print(value);
                        if (value) {
                          validNo = true;
                        } else {
                          validNo = false;
                        }
                      },
                      selectorType: PhoneInputSelectorType.DIALOG,
                      ignoreBlank: true,
                      autoValidate: true,
                      initialValue: number,
                      textFieldController: controller,
                    ),
                  ),
                ),
                // RaisedButton(
                //   onPressed: () {
                //     getPhoneNumber('+15417543010');
                //   },
                //   child: Text('Update'),
                // ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Gender',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                //  CustomDropDown(_setEerror),
                // Card(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                //   child:
                Container(
                  // height: 60,
                  // padding: EdgeInsets.all(16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: DropDownFormField(
                      innerBackgroundColor: Colors.white,
                      wedgeIcon: Icon(Icons.keyboard_arrow_down),
                      wedgeColor: Colors.grey,
                      innerTextStyle: TextStyle(color: Colors.grey),
                      focusNode: focusNode,
                      inputDecoration:
                          // textInputDecoration,
                          OutlinedDropDownDecoration(
                        labelStyle: TextStyle(color: Colors.green),
                        labelText: "",
                        // borderColor: Colors.white
                        borderRadius: BorderRadius.circular(200.0),
                        borderStyle: BorderStyle.none,
                      ),
                      hintText: '',
                      validator: (val) =>
                          val == null ? '   please choose gender' : null,
                      value: _gender,
                      onSaved: (value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                      onChanged: (val) {
                        setState(() {
                          _gender = val;
                        });
                      },
                      dataSource: dataSource,
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                ),
                // ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                //SnackBar
                Builder(builder: (context) {
                  return Container(
                    // constraints: BoxConstraints(minHeight: 60, maxHeight: 80),
                    height: 60.0,
                    child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (validNo) {
                              // Navigator.pushReplacementNamed(
                              //     context, '/nav');

                              widget.user.gender = _gender;
                              auth.registerUser(widget.user);
                            } else {
                              // error = 'please choose gender';
                              SnackBar registrationBar = SnackBar(
                                content: Text(
                                  'Invalid phone number Try Again!',
                                ),
                              );
                              Scaffold.of(context).showSnackBar(registrationBar);
                            }
                          }
                          // Navigator.of(context).pushReplacementNamed('/nav');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        padding: EdgeInsets.all(0.0),
                        child: buttonWithGradient('Sign Up')
                    ),
                  );
                }),

                SizedBox(height: 12.0),
                bottomSection('Already have an account?'),
              ],
            ),
          )),
    );
  }
}
