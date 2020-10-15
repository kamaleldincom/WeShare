import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:weshare_main/models/ride.dart';

class LocationSearch extends StatefulWidget {
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  CurrentRides ride;

  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated (GoogleMapController controller){
    _controller = controller;
    _location.onLocationChanged.listen((l){
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15,),),);
    });
  }
  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(1.559701, 103.637786), zoom: 11,),
            myLocationEnabled: true,  
            onMapCreated: _onMapCreated,
          ),
          Positioned(
                  top: 70.0,
                  right: 15.0,
                  left: 15.0,
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(1),
                      boxShadow: [
                        // BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(1.0, 5.0),
                        //     blurRadius: 10,
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
                            Icons.location_on,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        hintText: "pick up",
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                      ),
                    ),
                  ),
                ),
           Positioned(
                  top: 125.0,
                  right: 15.0,
                  left: 15.0,
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).accentColor,
                      ),
                      color: Colors.white.withOpacity(0.9),
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Colors.grey,
                      //       offset: Offset(1.0, 5.0),
                      //       blurRadius: 10,
                      //       spreadRadius: 3)
                      // ],
                    ),
                    child: TextField(
                      cursorColor: Colors.black,
                      // controller: appState.destinationController,
                      textInputAction: TextInputAction.go,
                      // onSubmitted: (value) {
                      //   appState.sendRequest(value);
                      // },
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
                        hintText: "destination?",
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                      ),
                    ),
                  ),
                ),
        ],
      )
    );
  }
}