import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/screens/history.dart';
import 'package:weshare_main/services/database.dart';

import 'constants.dart';

class Rides extends StatefulWidget {
  // final List<Ride> _rides;
  final String usertype;
  Rides(this.usertype);
  @override
  _RidesState createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context) ?? [];
    //  List<Ride> ride = Provider.of<List<Ride>>(context) ?? [];
    return StreamProvider<List<CurrentRides>>.value(
      value: DatabaseService(uid: user.uid).userRides(widget.usertype),
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(140.0),
              child: AppBar(
                brightness: Brightness.light,
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
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
                    SizedBox(height: 10.0),
                    Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                child: CurrentListView(widget.usertype),
              ),
              History(widget.usertype),
            ]),
          )),
    );
  }
}

class CurrentListView extends StatefulWidget {

  CurrentListView(this.usertype);
  final usertype;

  @override
  _CurrentListViewState createState() => _CurrentListViewState();
}

class _CurrentListViewState extends State<CurrentListView> {
  @override
  Widget build(BuildContext context) {
    DatabaseService dbserveice = DatabaseService();
    List<CurrentRides> rides = dbserveice.filterRides(
        Provider.of<List<CurrentRides>>(context) ?? [], 'current');
    //  print('trying rides: ${rides}');

    return rides.isEmpty
        ? Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 6),
                Icon(
                  Icons.directions_car,
                  size: 90,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 20),
                widget.usertype == 'Driver'
                    ? Text(
                        'You don\'t have any upcoming rides for now!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[500]),
                      )
                    : Text(
                        'You don\'t have any current rides now!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[500]),
                      )
              ],
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            // itemExtent: 100.0,
            shrinkWrap: true,
            itemCount: rides.length,
            itemBuilder: (context, index) =>
                currentRideCard(context, rides[index], widget.usertype),
          );
  }
}
