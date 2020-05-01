import 'package:flutter/material.dart';


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
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
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
                              child: Text("Current",
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
                              )
                              ),
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
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                // itemExtent: 100.0,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) => Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    // padding: EdgeInsets.symmetric(vertical: ),

                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Container(
                    height: 52,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(0),
                              height: 16,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(' Electrical (FKE) P05'),
                            Text(' Electrical (FKE) P05'),
                          ],
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Builder(builder: (context) {
              return Container(
                height: 60.0,
                child: FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Colors.grey,
                          child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 115.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text('Leave ride',
                                  style: TextStyle(color: Colors.white)),
                  ),
                          ),
              );
            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                        Container(
                          padding: EdgeInsets.only(top: 5,bottom:8),
                          decoration: BoxDecoration(
                            // color: ,
                          color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                  Container(
                            margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                            child: Text(
                              'Chats',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.blue[300],
                                          child: Text(
                                            '+1',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.blue[300],
                                          child: Text(
                                            '+1',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.blue[300],
                                          child: Text(
                                            '+1',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                           Text(
                        '7:43 AM',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Mutasim: I’m waiting in fro…',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                          ],
                        ),
                                    Container(
                            height: 26,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).accentColor,
                              child: Text('1', style: TextStyle(color: Colors.white,),),
                            ),
                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
              ),),

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
                          Text('at 7:30 AM', style: TextStyle(color: Colors.grey),),
                          Text('By Ali Qasmi', style: TextStyle(color: Colors.grey),),
                        ]),
                  ),
                ),
              ),
            ),

          ]),
        ));
  }
}
