import 'package:flutter/material.dart';

import 'constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    
        return WillPopScope(
              onWillPop: () => Future.value(false),
              child: Scaffold(
              backgroundColor: Color(0xFFF1F3F5),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                elevation: 0.0,
                centerTitle: true,
                backgroundColor: Color(0xFF76D3FF),
              ),
              body: Column(
                children: <Widget>[
                  Container(
                    height: 270.0,
                    decoration: BoxDecoration(
                        gradient: linearGradientvertical),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        radius: 50.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      child: Center(
                        child: Column(children: <Widget>[
                          Text(
                            'Ahmed Kamal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '+60130000000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'ahmed@kamaleldin.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              padding: EdgeInsets.symmetric(horizontal:15, vertical: 13),
                              onPressed: () {},
                              child: Text(
                                'Help & Support',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                           
                            Builder(builder: (context) {
                            return FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/settings');
                        
                              },
                              padding: EdgeInsets.fromLTRB(30, 13, 15, 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            );
                             }),
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Switch Mode',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: <Color>[Color(0xFF9ADAFC), Color(0xFF8496FD)])),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(65, 10, 65, 10),
                        onPressed: () {},
                        child: Text(
                          'Rider',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF5C79FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(7.0),
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                        onPressed: () {},
                        child: Text(
                          'Driver',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ]),
              ),
              Container(
                height: 200,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),),
    );
        // bottomNavigationBar: BtmNavBar());
  }
}
