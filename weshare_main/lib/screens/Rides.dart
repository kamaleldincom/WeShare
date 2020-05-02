import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: AppBar(
              backgroundColor: Colors.white,
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
                  SizedBox(height: 30.0),
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
                itemBuilder: (context, index) => currentRideCard(context,'Leave ride',Colors.grey ),
              ),
            ),
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemExtent: 100.0,
                shrinkWrap: true,
                itemCount: 4,
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
                          Text(
                            'at 7:30 AM',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'By Ali Qasmi',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  

}
