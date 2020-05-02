// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';

import '../constants.dart';
import 'auth_consts.dart';

class SignUpStep1 extends StatefulWidget {
  
  final next;
  SignUpStep1(this.next);

  @override
  _SignUpStep1State createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1> {

    final _formKey = GlobalKey<FormState>();
String error = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),

              Text('Full Name',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey, fontSize: 14.0)),
              Material(
                elevation: 2.0,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Enter a name' : null,
                  onChanged: (val) {},
                ),
              ),
              SizedBox(
                height: 20.0,
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
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    // setState(() => email = val);
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
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
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  obscureText: true,
                  onChanged: (val) {
                    // setState(() => password = val);
                  },
                ),
              ),
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
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () async {
                      // if (_formKey.currentState.validate()) {
                      //   if (email == 'test@test.com' && password == '123456') {
                      //   } else {
                      //     SnackBar registrationBar = SnackBar(
                      //       content: Text(
                      //         'Invalid Login/Password.. Try Again!',
                      //       ),
                      //     );
                      //     Scaffold.of(context).showSnackBar(registrationBar);
                      // Navigator.push(context, '/');
                      widget.next();
                      // }
                      // }
                    },
                    color: Colors.white,
                    elevation: 0.0,
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
                  ),
                );
              }),
              SizedBox(height: 12.0),
              bottomSection('Already have an account?'),
            ],
          ),
        ));
  }
}



//------------------------ Step 2 ------------------------ ------------------------



class SignUpStep2 extends StatefulWidget {

 final previous;
  SignUpStep2(this.previous);
  @override
  _SignUpStep2State createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {

  String _gender;
  String _genderResult;
  FocusNode focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  List dataSource=[
    {
      "display": "Male",
      "value": "Male",
    },
    {
      "display": "Female",
      "value": "Female",
    },
  ];



  final _formKey = GlobalKey<FormState>();

  var error = '';
  String _setEerror(){
   
    
    setState(() {
       error = 'Plese choose gender';
    print(error);
    
    });
    return error ='Plese choose gender';
  }
// phone number dropdown ------------------------
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'MY';
  PhoneNumber number = PhoneNumber(isoCode: 'MY');

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');
    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
//------------------------ ------------------------ ------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50.0),
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
              SizedBox(
                height: 40.0,
              ),
              Text('Phone Number',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey, fontSize: 14.0)),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  child: InternationalPhoneNumberInput.withCustomDecoration(
                    // autoFocus: false,
                    inputDecoration: textInputDecoration,
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorType: PhoneInputSelectorType.DIALOG,
                    ignoreBlank: false,
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
              Card(
      shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
          child: Container(
              // padding: EdgeInsets.all(16),
              child: DropDownFormField(
                innerBackgroundColor: Colors.white,
                wedgeIcon: Icon(Icons.keyboard_arrow_down),
                wedgeColor: Colors.grey,
                innerTextStyle: TextStyle(color: Colors.grey),
                focusNode: focusNode,
                inputDecoration: OutlinedDropDownDecoration(
                    labelStyle: TextStyle(color: Colors.green),
                    labelText: "",
                    // borderColor: Colors.white
                     borderRadius: BorderRadius.circular(200.0),
                     borderStyle: BorderStyle.none,
                    ),
                hintText: '',
                validator: (val) => val.isEmpty? _setEerror():false,
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
                  height: 60.0,
                  child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                        //   if (email == 'test@test.com' &&
                        //       password == '123456') {
                        //     Navigator.pushReplacementNamed(
                        //         context, '/nav');
                        //   } else {
                        //     SnackBar registrationBar = SnackBar(
                        //       content: Text(
                        //         'Invalid Login/Password.. Try Again!',
                        //       ),
                        //     );
                        //     Scaffold.of(context)
                        //         .showSnackBar(registrationBar);
                        //   }
                          Navigator.of(context).pushReplacementNamed('/nav');
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: EdgeInsets.all(0.0),
                      child: buttonWithGradient('Sign Up')),
                );
              }),

              SizedBox(height: 12.0),
              bottomSection('Already have an account?'),
            ],
          ),
        ));
  }
}



// ------------------------ ------------------------ ------------------------ ------------------------



// class CustomDropDown extends StatefulWidget {
//   var error;
//   CustomDropDown(this.error);
//   @override
//   _CustomDropDownState createState() => _CustomDropDownState();
// }

// class _CustomDropDownState extends State<CustomDropDown> {
//   String _gender;
//   String _genderResult;
//   FocusNode focusNode = FocusNode();
//   final formKey = GlobalKey<FormState>();
//   List dataSource=[
//     {
//       "display": "Male",
//       "value": "Male",
//     },
//     {
//       "display": "Female",
//       "value": "Female",
//     },
//   ];

//   @override
// //   void initState() {
// //     super.initState();
// //     _gender = '';
// //     _genderResult = '';
// //     focusNode.addListener(() {
// //       focusNode.unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
// // //      focusNode.
// //     });
// //   }

//   void _saveForm() {
//     var form = formKey.currentState;
//     if (form.validate()) {
//       setState(() {
//         _genderResult = _gender;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//           child: Container(
//               // padding: EdgeInsets.all(16),
//               child: DropDownFormField(
//                 innerBackgroundColor: Colors.white,
//                 wedgeIcon: Icon(Icons.keyboard_arrow_down),
//                 wedgeColor: Colors.grey,
//                 innerTextStyle: TextStyle(color: Colors.grey),
//                 focusNode: focusNode,
//                 inputDecoration: OutlinedDropDownDecoration(
//                     labelStyle: TextStyle(color: Colors.green),
//                     labelText: "",
//                     // borderColor: Colors.white
//                      borderRadius: BorderRadius.circular(200.0),
//                      borderStyle: BorderStyle.none,
//                     ),
//                 hintText: '',
//                 validator: (val) {
//                   if (val != 'Male' || val != 'Female') {
//                     widget.error();
//                   }else{
//                     return null;
//                   }
//                 },
//                 value: _gender,
//                 onSaved: (value) {
//                   setState(() {
//                     _gender = value;
//                   });
//                 },
//                 onChanged: (val) {
//                   setState(() {
//                     _gender = val;
//                   });
//                 },
//                 dataSource: dataSource,
//                 textField: 'display',
//                 valueField: 'value',
//               ),
//             ),
//     );
//   }
// }


