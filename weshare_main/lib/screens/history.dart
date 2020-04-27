import 'package:flutter/material.dart';
import 'package:weshare_main/weshare_icons.dart';
import 'constants.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Color(0xFFF1F3F5),
        appBar: AppBar(
          brightness: Brightness.light,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFF1F3F5),
          title: Text(
            'Rides',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: Column(
          children: <Widget>[
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
                      padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                      onPressed: () {
                        // Navigator.pushReplacementNamed(context, '/rides');
                      },
                      child: Text(
                        'Current',
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
                      padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                      onPressed: () {},
                      child: Text(
                        'History',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemExtent: 100.0,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                elevation: 0.0,
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0),
                        height: 16,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 16,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(' Electrical (FKE) P05'),
                      // SizedBox(height: 1),
                      Text(' Electrical (FKE) P05'),
                    ],
                  ),
                  trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('at 7:30 AM', style: TextStyle(color: Colors.grey),),
                        Text('By Ali Qasmi', style: TextStyle(color: Colors.grey),),
                      ]),
                ),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BtmNavBar(),
      ),
    );
  }
}
