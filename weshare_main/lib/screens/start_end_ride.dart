/*                                This page is dedicated for the drivers to start and their rides
                                   end their rides when dropping off the rider(Only Driver Side)
*/
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class StartEndRideInterface extends StatefulWidget {
  @override
  _StartEndRideInterfaceState createState() => _StartEndRideInterfaceState();
}

class _StartEndRideInterfaceState extends State<StartEndRideInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color(0xFF5C79FF),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          //! Chat Info.
          Card(
            margin: EdgeInsets.symmetric(horizontal: 17),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 12, right: 25),
              leading: Column(
                children: <Widget>[
                  Text(
                    'Chat',
                    style: TextStyle(color: Colors.grey[400], fontSize: 11.5),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/driver.png'),
                    radius: 13,
                  ),
                ],
              ),
              title: Text('7:45 AM',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[500],
                  )),
              subtitle: Text('You: Be in front gate guys!',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  )),
              trailing: Badge(
                badgeColor: Color(0xFF5C79FF),
                borderRadius: 50,
                toAnimate: true,
                badgeContent: Text('1', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
