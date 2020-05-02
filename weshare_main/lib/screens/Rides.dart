import 'package:flutter/material.dart';
import 'package:weshare_main/screens/history.dart';

import 'constants.dart';

class Rides extends StatefulWidget {
  @override
  _RidesState createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: AppBar(
              backgroundColor: Colors.grey[100],
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(
                      child: Text(
                    'Rides',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  )),
                  SizedBox(height: 10.0),
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: <Color>[
                              Color(0xFF9ADAFC),
                              Color(0xFF8496FD)
                            ])),
                    child: TabBar(
                        labelColor: Theme.of(context).accentColor,
                        unselectedLabelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          // gradient: LinearGradient(
                          //     colors: [Colors.redAccent, Colors.orangeAccent]),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Current",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("History",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            Container(
              // padding: EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                // itemExtent: 100.0,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) =>
                    currentRideCard(context, 'Leave ride', Colors.grey),
              ),
            ),
            History(),
          ]),
        ));
  }
}
