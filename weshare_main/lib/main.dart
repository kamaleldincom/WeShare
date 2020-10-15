import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/screens/AccountDetails.dart';
import 'package:weshare_main/screens/Dashboard.dart';
import 'package:weshare_main/screens/LocationSearch.dart';
// import 'package:weshare_main/screens/Dashboard.dart';
import 'package:weshare_main/screens/Notifications.dart';
// import 'package:weshare_main/screens/newRides.dart';
import 'package:weshare_main/screens/chat_screen.dart';
import 'package:weshare_main/services/auth.dart';
import 'package:weshare_main/wrapper.dart';
import './screens/edit_car_details.dart';
import 'package:weshare_main/screens/ride_summary.dart';
// import 'package:weshare_main/screens/Profile.dart';
// import 'package:weshare_main/screens/Rides.dart';
import 'package:weshare_main/screens/rrDetails.dart';
import 'package:weshare_main/screens/history.dart';
import 'package:weshare_main/screens/authentication/Login.dart';
import 'package:weshare_main/screens/constants.dart';
import 'package:weshare_main/screens/postRide.dart';
import 'package:weshare_main/screens/splash.dart';
import 'package:flutter/services.dart';
import 'package:weshare_main/screens/settings.dart';
import 'package:weshare_main/screens/start_end_ride.dart';
import 'package:weshare_main/screens/driver_registeration.dart';


import 'screens/Profile.dart';
import 'screens/provide-ride.dart';
// import 'package:provider/provider.';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          // brightness: Brightness.dark,
          primaryColor: Color(0xFF5C79FF),
          accentColor: Color(0xFF5C79FF),
          backgroundColor: Color(0xFFF1F3F5),

          // fontFamily: 'SegoeUI',
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                //   fontFamily: 'SegoeUI',
                fontSize: 16,
              )),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    //  fontFamily: 'SegoeUI',
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        // home: DriverRegistration(0),
        home: Wrapper(),
        routes: {
          // '/': (context) => Loading(),
          '/wrapper': (context) => Wrapper(),
          '/settings': (context) => Settings(),
          '/login': (context) => Login(),
          '/splash': (context) => Splash(),
          //   '/profile': (context) => Profile(),
          '/notifications': (context) => Notifications(),
          // '/rides': (context) => Rides(),
          // '/history': (context) => History(),
          // '/dashboard': (context) => Dashboard(),
          '/nav': (context) => BtmNavBar(),
          '/driverNav': (context) => BtnDriver(),
          '/provide-ride': (context) => ProvideRide(),
          '/postRide': (context) => PostRideInterface(),
          '/startEndRide': (context) => StartEndRideInterface(),
          '/AccountDetails': (context) => AccountDetails(),
          '/RrDetails': (context) => RrDetails(),
          '/rideSummary': (context) => RideSummary(),
          '/chatScreen': (context) => ChatScreen(),
          '/editCarDetails': (context) => EditCarDetails(),
          '/driverRegistration': (context) => DriverRegistration(0),
          '/locationSearch': (context) => LocationSearch(),
        },
      ),
    );
  }
}
