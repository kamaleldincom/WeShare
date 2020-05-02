// import 'package:flutter/material.dart';
// import 'package:weshare_main/weshare_icons.dart';
// import 'constants.dart';

// class Rides extends StatefulWidget {
//   @override
//   _RidesState createState() => _RidesState();
// }

// class _RidesState extends State<Rides> {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => Future.value(false),
//       child: Scaffold(
//         backgroundColor: Color(0xFFF1F3F5),
//         appBar: AppBar(
//           brightness: Brightness.light,
//           automaticallyImplyLeading: false,
//           backgroundColor: Color(0xFFF1F3F5),
//           title: Text(
//             'Rides',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           elevation: 0.0,
//           centerTitle: true,
//           actions: <Widget>[],
//         ),
//         body: Column(
//           children: <Widget>[
//             Container(
//               height: 60,
//               margin: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   gradient: LinearGradient(
//                       begin: Alignment.bottomLeft,
//                       end: Alignment.topRight,
//                       colors: <Color>[Color(0xFF9ADAFC), Color(0xFF8496FD)])),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     FlatButton(
//                       color: Colors.white,
//                       padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
//                       onPressed: () {
//                         Navigator.pushReplacementNamed(context, '/Rides');
//                       },
//                       child: Text(
//                         'Current',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           color: Color(0xFF5C79FF),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       shape: new RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(7.0),
//                       ),
//                     ),
//                     FlatButton(
//                       padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
//                       onPressed: () {
//                         Navigator.pushReplacementNamed(context, '/history');
//                       },
//                       child: Text(
//                         'History',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ]),
//             ),
//             Card(
//               elevation: 4.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     // padding: EdgeInsets.symmetric(vertical: ),

//                     height: 150,
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   Container(
//                     height: 52,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.all(0),
//                               height: 16,
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.grey,
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             Container(
//                               height: 16,
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.grey,
//                               ),
//                             )
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Text(' Electrical (FKE) P05'),
//                             Text(' Electrical (FKE) P05'),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 80,
//                         ),
//                         Builder(builder: (context) {
//               return Container(
//                 height: 60.0,
//                 child: FlatButton(
//                           onPressed: () {},
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50.0),
//                           ),
//                           color: Colors.grey,
//                           child: Container(
//                     constraints:
//                         BoxConstraints(maxWidth: 115.0, minHeight: 50.0),
//                     alignment: Alignment.center,
//                     child: Text('Leave ride',
//                                   style: TextStyle(color: Colors.white)),
//                   ),
//                           ),
//               );
//             }),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),

//                         Container(
//                           padding: EdgeInsets.only(top: 5,bottom:8),
//                           decoration: BoxDecoration(
//                             // color: ,
//                           color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[

//                   Container(
//                             margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
//                             child: Text(
//                               'Chats',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 14.0,
//                               ),
//                             ),
//                           ),
//                               Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 10),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Row(
//                                       children: <Widget>[
//                                         CircleAvatar(
//                                           backgroundColor: Colors.blue[300],
//                                           child: Text(
//                                             '+1',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ),
//                                         CircleAvatar(
//                                           backgroundColor: Colors.blue[300],
//                                           child: Text(
//                                             '+1',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ),
//                                         CircleAvatar(
//                                           backgroundColor: Colors.blue[300],
//                                           child: Text(
//                                             '+1',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                            Text(
//                         '7:43 AM',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 14,
//                         ),
//                       ),
//                       Text(
//                         'Mutasim: I’m waiting in fro…',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                         ),
//                       ),
//                           ],
//                         ),
//                                     Container(
//                             height: 26,
//                             child: CircleAvatar(
//                               backgroundColor: Theme.of(context).accentColor,
//                               child: Text('1', style: TextStyle(color: Colors.white,),),
//                             ),
//                           ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         // bottomNavigationBar: BtmNavBar(),
//       ),
//     );                       
//   }
// }
