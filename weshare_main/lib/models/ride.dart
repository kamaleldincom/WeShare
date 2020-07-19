import 'package:timeago/timeago.dart' as timeago;


import 'package:intl/intl.dart';
import 'package:weshare_main/models/user.dart';

class Ride{
  String rid;
  User user;
  String from;
  String to;
  // String date;
  String time;
  String dateTime;
  String dateAdded;
  String date;
  int seatsAvailable;
  String genderPreference;
  double price;
  String note;
  Driver driver;
  Ride({this.user,this.from, this.to, this.date, time, this.dateTime, this.dateAdded, this.seatsAvailable, this.genderPreference, this.price, this.note, this.driver}){
     this.dateAdded = ago(dateAdded);
  }


  String ago(String datetime){
    DateTime tmp = DateFormat("yyyy-MM-dd hh:mm:ss").parse(datetime);
    return timeago.format(tmp);
  }
  // String pickuptime(String datetime){
  //   DateTime tmp = DateFormat("yyyy-MM-dd hh:mm:ss").parse(datetime);
  //   return timeago.format(tmp);
  // }
}

class Driver {
  String name;
  Car car;
  Driver(Map<String, dynamic> data){
    this.name = data['name'];

    this.car = Car(cid:data['car']['id'],plateNumber: data['car']['plateNumber'],seatsNo: data['car']['seatsNo'],color:data['car']['color'],type:data['car']['type']);
  }
  // license
  // idDoc
}

class Car {
  String uid;
  String cid;
  int seatsNo;
  String type;
  String plateNumber;
  String color;

  Car({this.cid,this.color,this.plateNumber,this.type,this.seatsNo});
}


class Rode{
  String rid;
  User user;
  String from;
  String to;
  // String date;
  String time;
  String dateTime;
  String dateAdded;
  String date;
  int seatsAvailable;
  String genderPreference;
  double price;
  String note;
  Driver driver;
  Rode({this.user,this.from, this.to, this.date, time, this.dateTime, this.dateAdded, this.seatsAvailable, this.genderPreference, this.price, this.note, this.driver}){
     this.dateAdded = ago(dateAdded);
  }

  String ago(String datetime){
    DateTime tmp = DateFormat("yyyy-MM-dd hh:mm:ss").parse(datetime);
    return timeago.format(tmp);
  }
}
