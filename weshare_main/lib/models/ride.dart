


import 'package:weshare_main/models/user.dart';

class Ride{

  User user;
  String origin;
  String destination;
  String date;
  String time;
  int seatsAvailable;
  String genderPreference;
  double price;
  String note;

  Ride({this.user,this.origin, this.destination, this.date, this.time, this.seatsAvailable, this.genderPreference, this.price, this.note});
}