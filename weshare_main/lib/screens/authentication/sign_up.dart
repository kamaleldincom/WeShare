// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

Container signUpA(GlobalKey<FormState> _formKey) {
  return Container(
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
                onChanged: (val) {
                  // setState(() => email = val);
                },
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
                    if (_formKey.currentState.validate()) {
                      //   if (email == 'test@test.com' && password == '123456') {
                      //   } else {
                      //     SnackBar registrationBar = SnackBar(
                      //       content: Text(
                      //         'Invalid Login/Password.. Try Again!',
                      //       ),
                      //     );
                      //     Scaffold.of(context).showSnackBar(registrationBar);
                      // Navigator.push(context, '/');
                    }
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
            InkWell(
              child: Text(
                'Already have an account?',
                style: TextStyle(color: Colors.blue, fontSize: 14.0),
              ),
              onTap: () {},
            ),
            Divider(),
            Text('Or Sign-up using ',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.grey, fontSize: 18.0)),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('assets/icon-google.png'),
                Image.asset('assets/icon-facebook.png'),
              ],
            )
          ],
        ),
      ));
}
