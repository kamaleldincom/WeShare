import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
            'Notifications',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),  
          ),
          elevation: 0.0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_outline), 
              iconSize: 26,
              color: Color(0xFF5C79FF),
              onPressed: (){},
            )
          ],
          
        ),
        
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index) => Card(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            elevation: 0.0,
              child: ListTile(
              
              leading:  CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                radius: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 19.5,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/person1.jpeg'),
                    radius: 18,
                  ),
                ),
              ),
            //   Container(
            //   width: 50,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       color: Colors.white,
            //       width: 3,
            //     ),
            //     boxShadow: [
            //       BoxShadow(
            //           color: Colors.grey.withOpacity(.3),
            //           offset: Offset(0, 5),
            //           blurRadius: 25)
            //     ],
            //   ),
            //   child: Stack(
            //     children: [
            //       Positioned.fill(
            //         child: CircleAvatar(
            //           backgroundImage:
            //               AssetImage('assets/logo.png'),
            //         ),
            //       ),
                   // friendsList[i]['isOnline']
                   //     ? Align(
                   //         alignment: Alignment.topRight,
                   //         child: Container(
                   //           height: 15,
                   //           width: 15,
                   //           decoration: BoxDecoration(
                   //             border: Border.all(
                   //               color: Colors.white,
                   //               width: 3,
                   //             ),
                   //             shape: BoxShape.circle,
                   //             color: Colors.green,
                   //           ),
                   //         ),
                   //       ) :
            //            Container(),
            //     ],
            //   ),
            // ),
            title: Container(
              padding: EdgeInsets.symmetric(vertical: 8,),
              child: Text(
                            'Ride to Electrical (FKE) P05',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                overflow: TextOverflow.ellipsis,                            
              ),
            ),       
            subtitle: Text(
             'Ali Qasmi: Im at the Gate @Ahmed Kamal',
             overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              children: <Widget>[
                  Text(
                    '7:43 AM',
                    style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.5, 
                          ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 40,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color(0xFF5C79FF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'NEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  )
                ],
            ),
            ),
          ),
        ),
        // bottomNavigationBar: BtmNavBar(),
      ),
    );
  }
}


