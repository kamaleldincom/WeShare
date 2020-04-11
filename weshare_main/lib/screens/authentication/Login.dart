import 'package:flutter/material.dart';
import '../constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final _formKey = GlobalKey<FormState>();

  String email = 'test@test.com';
  String password = '123456';
  String error = '';

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(202.0),
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Column(
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
                                  Navigator.pushNamed(context, '/nav');
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
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blue, fontSize: 14.0),
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
              )),
          Container(color: Colors.blue, child: Center(child: Text('sign up'))),
        ]),
      ),
    );
  }
}
