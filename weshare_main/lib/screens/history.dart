import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/services/database.dart';

class History extends StatefulWidget {
  // const History({
  //   Key key,
  // }) : super(key: key);

  // final List<Ride> _rides;

  final String usertype;
  History(this.usertype);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    DatabaseService dbserveice = DatabaseService();
    List<CurrentRides> rides = dbserveice.filterRides(
        Provider.of<List<CurrentRides>>(context) ?? [], 'history');

    return rides.isEmpty
        ? Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 6),
                Icon(
                  Icons.history,
                  size: 90,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 20),
                widget.usertype == 'Driver'
                    ? Text(
                        'You haven\'t completed any rides in the past yet!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[500]),
                      )
                    : Text(
                        'You haven\'t joined any ride in the past yet!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[500]),
                      )
              ],
            ),
          )
        : Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemExtent: 80.0,
              shrinkWrap: true,
              itemCount: rides.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 0.0,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/rideSummary',
                        arguments: rides[index]);
                  },
                  // leading: Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: <Widget>[
                  //     Container(
                  //       padding: EdgeInsets.all(0),
                  //       height: 16,
                  //       child: CircleAvatar(
                  //         backgroundColor: Colors.blue,
                  //       ),
                  //     ),
                  //     SizedBox(height: 20),
                  //     Container(
                  //       height: 16,
                  //       child: CircleAvatar(
                  //         backgroundColor: Colors.grey,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("Ride From ${rides[index].from} ", style: TextStyle(fontSize: 17),),
                          // SizedBox(height: 1),
                          Text("To ${rides[index].to}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'at ${rides[index].dateTime}',
                            style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w800),
                          ),
                          widget.usertype == 'Rider'
                              ? Text(
                                  'By ${rides[index].driver.name}',
                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w800),
                                )
                              : Text(''),
                        ],
                  ),    

                    ],
                  ),
                  // trailing: Row(
                  //   children: [
                  //     Text(
                  //       'at ${rides[index].dateTime}',
                  //       style: TextStyle(color: Colors.grey),
                  //     ),
                  //     widget.usertype == 'Rider'
                  //         ? Text(
                  //             'By ${rides[index].driver.name}',
                  //             style: TextStyle(color: Colors.grey),
                  //           )
                  //         : Text(''),
                  //   ],
                  // ),
                ),
              ),
            ),
          );
  }
}
