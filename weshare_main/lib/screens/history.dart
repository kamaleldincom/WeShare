import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({
    Key key,
  }) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            onTap: (){
              Navigator.pushNamed(context, '/rideSummary');
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
    );
  }
}
