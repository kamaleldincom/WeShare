import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/services/database.dart';

class History extends StatefulWidget {
  // const History({
  //   Key key,
  // }) : super(key: key);

  final List<Ride> _rides;
  
  final String usertype;
  History(this.usertype,this._rides);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {


  @override
  Widget build(BuildContext context) {
    DatabaseService dbserveice = DatabaseService();
  List<CurrentRides> rides = dbserveice.filterRides(Provider.of<List<CurrentRides>>(context)??[], 'history');
  
    return Container(
      child: ListView.builder(
        
        scrollDirection: Axis.vertical,
        itemExtent: 100.0,
        shrinkWrap: true,
        itemCount: rides.length ,
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          elevation: 0.0,
          child: ListTile(
            onTap: (){
              Navigator.pushNamed(context, '/rideSummary', arguments:  rides[index]);

            },
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
                Text(rides[index].from),
                // SizedBox(height: 1),
                Text(rides[index].to),
              ],
            ),
            trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'at ${rides[index].dateTime}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  widget.usertype == 'Rider' ?Text(
                    'By Ali Qasmi',
                    style: TextStyle(color: Colors.grey),
                  ):Text(''),
                ]),
          ),
        ),
      ),
    );
  }
}
