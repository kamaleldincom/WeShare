import 'package:flutter/material.dart';
import 'package:weshare_main/weshare_icons.dart';
import 'constants.dart';

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
        // body: Container(
        //     height: 90,
        //     margin: EdgeInsets.all(15),
        //     padding: EdgeInsets.all(18),
        //     decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10)
        //     ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Row(
        //         children: <Widget>[
                  
        //           CircleAvatar(
        //             backgroundImage: AssetImage('assets/logo.png'),
        //             radius: 30.0,

        //           ),
        //           SizedBox(width: 10,),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>[
        //               Text(
        //                 'Ride to Electrical (FKE) P05',
        //                 style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //               SizedBox(height: 15.0,),
        //               Container(
        //                 width: MediaQuery.of(context).size.width * 0.45,
        //                 child: Text(
        //                   'Ali Qasmi: Im at the Gate @Ahmed Kamal',
        //                   style: TextStyle(
        //                     color: Colors.grey,
        //                     fontSize: 14,
        //                     fontWeight: FontWeight.w500,
        //                   ),
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //       Column(
        //         children: <Widget>[
        //           Text(
        //             '7:43 AM',
        //             style: TextStyle(
        //                     color: Colors.grey,
        //                     fontSize: 13,
        //                     fontWeight: FontWeight.w400,
        //                     letterSpacing: -0.5, 
        //                   ),
        //           ),
        //           SizedBox(height: 10.0),
        //           Container(
        //             width: 40,
        //             height: 25,
        //             decoration: BoxDecoration(
        //               color: Color(0xFF5C79FF),
        //               borderRadius: BorderRadius.circular(30),
        //             ),
        //             alignment: Alignment.center,
        //             child: Text(
        //               'NEW',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 12,
        //                 fontWeight: FontWeight.bold,
        //               ),

        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        
        // body: ListView.separated(
        //   itemCount: criteria.length,
        //   itemBuilder: (context, index) => ListTile(
        //     title: Text(criteria[index].title),
        //     subtitle: Text(criteria[index].description),
        //     trailing: DropdownButton<int>(
        //       value: widget._data.points[index],
        //       items: scales
        //           .map(
        //             (scale) => DropdownMenuItem(
        //               value: scale.value,
        //               child: Text(scale.title),
        //             ),
        //           )
        //           .toList(),
        //       onChanged: (newValue) =>
        //           setState(() => widget._data.points[index] = newValue),
        //     ),
        //   ),
        //   separatorBuilder: (context, index) => Divider(
        //     color: Colors.grey,
        //   ),
        // ),
        
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
                       backgroundImage:
                          AssetImage('assets/logo.png'),
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


