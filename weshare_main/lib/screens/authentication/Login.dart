import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';
import 'package:weshare_main/screens/authentication/sign_up.dart';
import '../constants.dart';
import 'package:weshare_main/screens/authentication/auth_consts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  var index = 0;

  void _next() {
    index = 1;
    setState(() {});
  }

  void _previous() {
    index = 0;
    setState(() {});
  }

  void _gender_value(String gender, dynamic value) {
    setState(() {
      gender = value;
    });
  }

  // phone number dropdown

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

// ---------------------------------------------------------------------------

  String email = 'test@test.com';
  String password = '123456';
  String error = '';

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(202.0),
            child: AppBar(
              brightness: Brightness.light,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset(
                      'assets/logo.png',
                      // fit: BoxFit.contain,
                      height: 150,
                    ),
                    SizedBox(height: 1.0),
                    TabBar(
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.black,
                        indicatorWeight: 4.0,
                        indicatorColor: Theme.of(context).accentColor,
                        tabs: [
                          Tab(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                              child: Text(
                            'Sign-up',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
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
                                  if (email == 'test@test.com' &&
                                      password == '123456') {
                                    Navigator.pushReplacementNamed(
                                        context, '/nav');
                                  } else {
                                    SnackBar registrationBar = SnackBar(
                                      content: Text(
                                        'Invalid Login/Password.. Try Again!',
                                      ),
                                    );
                                    Scaffold.of(context)
                                        .showSnackBar(registrationBar);
                                  }
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              padding: EdgeInsets.all(0.0),
                              child: buttonWithGradient('login')),
                        );
                      }),

                      SizedBox(height: 12.0),
                      bottomSection('Forgot Password?'),
                    ],
                  ),
                )),
            signUpA(context, _formKey2, _next, _gender_value, _previous, number,
                controller, getPhoneNumber)[index],
          ]),
        ),
      ),
    );
  }
}

List<Container> signUpA(context, GlobalKey<FormState> _formKey, _next,
    _gender_value, _previous, number, controller, getPhoneNumber) {
  String gender = 'Male';
  return [
    Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
              // Text(
              //   error,
              //   style: TextStyle(color: Colors.red, fontSize: 14.0),
              // ),
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
                      // }
                      _next();
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
        )),
    Container(
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
                  _previous();
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              Text('Phone Number',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey, fontSize: 14.0)),
              // Material(
              //   elevation: 2.0,
              //   shadowColor: Colors.black,
              //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //   child: TextFormField(
              //     decoration: textInputDecoration,
              //     validator: (val) => val.isEmpty ? 'Enter an email' : null,
              //     onChanged: (val) {
              //       // setState(() => email = val);
              //     },
              //   ),
              // ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  child: InternationalPhoneNumberInput.withCustomDecoration(
                    inputDecoration: textInputDecoration.copyWith(),
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorType: PhoneInputSelectorType.DIALOG,
                    ignoreBlank: false,
                    autoValidate: false,
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
               CustomDropDown(),
              SizedBox(
                height: 20.0,
              ),
              Text(
                // error,
                'error',
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              //SnackBar
              Builder(builder: (context) {
                return Container(
                  height: 60.0,
                  child: RaisedButton(
                      onPressed: () async {
                        // if (_formKey.currentState.validate()) {
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
                        // }
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
        )),
  ];
}








class CustomDropDown extends StatefulWidget {
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String _myActivity;
  String _myActivityResult;
  FocusNode focusNode = FocusNode();
  final formKey = new GlobalKey<FormState>();
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

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
//     focusNode.addListener(() {
//       focusNode.unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
// //      focusNode.
//     });
  }

  // _saveForm() {
  //   var form = formKey.currentState;
  //   if (form.validate()) {
  //     setState(() {
  //       _myActivityResult = _myActivity;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                value: _myActivity,
                onSaved: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                dataSource: dataSource,
                textField: 'display',
                valueField: 'value',
              ),
            ),
    );
  }
}