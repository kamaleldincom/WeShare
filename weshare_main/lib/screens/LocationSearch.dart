import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/stops.dart';
import 'dart:async';

class LocationSearch extends StatefulWidget {
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  CurrentRides ride;

  GoogleMapController _controller;
  Location _location = Location();
  List<Marker> allMarkers = [];

  bool _btnVisible = false;

  void _onMapCreated (controller) {
    _controller = controller;
    // _location.onLocationChanged.listen((l){
    //   _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15,),),);
    // });
  }
  @override
  void initState() {
    
    super.initState();
    stopLocations.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.stopName),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.stopName, snippet: element.address),
          position: element.locationCoords,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
          onTap: () {
            setState(() {
              _btnVisible = !_btnVisible;
            });
          },
      ));
    });
    // _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
    //   ..addListener(_onScroll);
  }
  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[Container(
              height: MediaQuery.of(context).size.height*3/5,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(target: LatLng(1.544376, 103.632673), zoom: 13,),
                // myLocationEnabled: true,  
                onMapCreated: _onMapCreated,
                markers: Set.from(allMarkers),
              ),
            ),
            Positioned(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Container(
                  // height: 20,
                  // width: 20,
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                    // gradient: linearGradientvertical,
                    color: Colors.white,
                    
                  ),
                  
                  child: BackButton(
                    color: Theme.of(context).accentColor,
                    
                  ),
                ),
              ),
            ),
            ]
          ),
          // Positioned(
          //         top: 70.0,
          //         right: 15.0,
          //         left: 15.0,
          //         child: Container(
          //           height: 50.0,
          //           width: double.infinity,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10.0),
          //             color: Colors.white.withOpacity(1),
          //             boxShadow: [
          //               // BoxShadow(
          //               //     color: Colors.grey,
          //               //     offset: Offset(1.0, 5.0),
          //               //     blurRadius: 10,
          //               //     spreadRadius: 1)
          //             ],
          //           ),
          //           child: TextField(
          //             cursorColor: Colors.black,
          //             // controller: appState.locationController,
          //             decoration: InputDecoration(
          //               icon: Container(
          //                 margin: EdgeInsets.only(left: 10, bottom: 5),
          //                 width: 15,
          //                 height: 15,
          //                 child: Icon(
          //                   Icons.location_on,
          //                   color: Theme.of(context).accentColor,
          //                 ),
          //               ),
          //               hintText: "pick up",
          //               border: InputBorder.none,
          //               // contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
          //             ),
          //           ),
          //         ),
                
          //       ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical:15),
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    // BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(1.0, 5.0),
                    //     blurRadius: 5,
                    //     spreadRadius: 1)
                  ],
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  
                  // controller: appState.locationController,
                  decoration: InputDecoration(
                    icon: Container(
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      width: 15,
                      height: 15,
                      child: Icon(
                        Icons.brightness_1,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    hintText: "Where u headin' G?",
                    hintStyle: TextStyle(
                      // color: Colors.purple,
                      // fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    border: InputBorder.none,
                    
                    // contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                  ),
                ),
              ),
              // SizedBox(height: 15,),
              Container(
                height: _btnVisible ? MediaQuery.of(context).size.height/5 : MediaQuery.of(context).size.height*2/5-90,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // color: Colors.white.withOpacity(1),
                  boxShadow: [
                    // BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(1.0, 5.0),
                    //     blurRadius: 10,
                    //     spreadRadius: 1)
                  ],
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade400,
                    indent: 20,
                    endIndent: 20,
                    height: 10,
                  ),
                  itemCount: stopLocations.length,
                  itemBuilder: (BuildContext context, int index) =>
                    buildPlaceCard(context, index),
                  ),
              ),
              
              Visibility(
                visible: _btnVisible,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // side: BorderSide(color: Colors.red)
                      ),
                      onPressed: (){}, 
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      child: Text('Confirm Drop-off Point!'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //  Positioned(
          //         top: 125.0,
          //         right: 15.0,
          //         left: 15.0,
          //         child: Container(
          //           height: 50.0,
          //           width: double.infinity,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10.0),
          //             border: Border.all(
          //               width: 1,
          //               color: Theme.of(context).accentColor,
          //             ),
          //             color: Colors.white.withOpacity(0.9),
          //             // boxShadow: [
          //             //   BoxShadow(
          //             //       color: Colors.grey,
          //             //       offset: Offset(1.0, 5.0),
          //             //       blurRadius: 10,
          //             //       spreadRadius: 3)
          //             // ],
          //           ),
          //           child: TextField(
          //             cursorColor: Colors.black,
          //             // controller: appState.destinationController,
          //             textInputAction: TextInputAction.go,
          //             // onSubmitted: (value) {
          //             //   appState.sendRequest(value);
          //             // },
          //             decoration: InputDecoration(
          //               icon: Container(
          //                 margin: EdgeInsets.only(left: 10, bottom: 5),
          //                 width: 15,
          //                 height: 15,
          //                 child: Icon(
          //                   Icons.brightness_1,
          //                   color: Theme.of(context).accentColor,
          //                 ),
          //               ),
          //               hintText: "destination?",
          //               border: InputBorder.none,
          //               // contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
          //             ),
          //           ),
          //         ),
          //       ),
       
        ],
      )
    );
  }
  Widget buildPlaceCard(BuildContext context, int index) {
    return Hero(
      tag: "SelectedTrip-${stopLocations[index].stopName}",
      transitionOnUserGestures: true,
      
      child: Container(
        
        child: InkWell(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(stopLocations[index].stopName,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  )),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                              stopLocations[index].address,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  ),
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            moveCamera(index);
            setState(() {
              _btnVisible = !_btnVisible;
            });
          },
        ),
      ),
    );
  }
  Future <void> moveCamera(int index) async{
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
    target: stopLocations[index].locationCoords,
    zoom: 15.0,
    bearing: 45.0,
    tilt: 15.0)));
  }
}