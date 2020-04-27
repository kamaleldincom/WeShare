import 'package:flutter/material.dart';
import 'package:weshare_main/weshare_icons.dart';

import 'constants.dart';
import 'myappbar.dart';
import 'myflexiableappbar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
        backgroundColor: Color(0xFFF1F3F5),
        // appBar: AppBar(
        //   brightness: Brightness.light,
        //   automaticallyImplyLeading: false,
        // backgroundColor: Color(0xFFF1F3F5),
          // title: Text(
          //   'WeShare',
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontWeight: FontWeight.w600,
          //   ),  
        //   ),
        //   elevation: 0.0,
        //   centerTitle: true,
        //   actions: <Widget>[
            
        //   ],
          
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              brightness: Brightness.dark,
              title: MyAppBar(),
              pinned: false,
              floating: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: MyFlexiableAppBar(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index){
                  return Container(
                    height: 210,
                    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(10)
                    ),
                    alignment: Alignment.center,
                    // color: Colors.orange[100*(index%9)],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/logo.png'),
                                radius: 23,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Title(
                                      color: Colors.black, 
                                      child: Text(
                                        'Ali Qasmi',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                        '13h ago',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        Container(),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 55,
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F9F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        'MYR',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                        '1.50',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22,
                                          color: Colors.grey[700],
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                              RaisedButton(
                                color: Theme.of(context).accentColor,
                                // padding: EdgeInsets.all(5),
                                onPressed: () {},
                                child: Text(
                                  'Join',
                                  style: TextStyle(
                                    fontSize: 19.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                  childCount: 9;

                }
              )
            ),
          ],
        ),
        // bottomNavigationBar: BtmNavBar(),
      ),
    );
  }
}