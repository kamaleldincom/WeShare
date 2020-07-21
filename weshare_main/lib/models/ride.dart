import 'package:timeago/timeago.dart' as timeago;

import 'package:intl/intl.dart';
import 'package:weshare_main/models/user.dart';

class Ride {
  String rid;
  User user;
  String from;
  String to;
  // String date;
  String time;
  String dateTime;
  String dateAdded;
  String date;
  int availableSeats;
  String genderPreference;
  double price;
  String note;
  String status;
  Driver driver;
  Ride(
      {this.rid,
      this.user,
      this.from,
      this.to,
      this.date,
      time,
      this.dateTime,
      this.dateAdded,
      this.availableSeats,
      this.genderPreference,
      this.price,
      this.note,
      this.status,
      this.driver}) {
    this.dateAdded = ago('2005-10-10 10:10:10');
  }

  String ago(String datetime) {
    DateTime tmp = DateFormat("yyyy-MM-dd hh:mm:ss").parse(datetime);
    return timeago.format(tmp);
  }
  // String pickuptime(String datetime){
  //   DateTime tmp = DateFormat("yyyy-MM-dd hh:mm:ss").parse(datetime);
  //   return timeago.format(tmp);
  // }

  Map<String, dynamic> toMap(Ride ride) {
    return {
      'from': ride.from,
      'to': ride.to,
      'availableSeats': ride.availableSeats,
      'dateTime': ride.dateTime,
      'price': ride.price,
      'driver': ride.driver.toMap(ride.driver),
      'status': ride.status
    };
  }
}

class Driver {
  String name;
  Car car;
  Driver(Map<String, dynamic> data) {
    this.name = data['name'];

    this.car = Car(
        // cid: data['car']['id'],
        plateNumber: data['car']['plateNo'],
        seatsNo: data['car']['seatsNo'],
        color: data['car']['color'],
        type: data['car']['type']);
  }

  Map<String, dynamic> toMap(Driver driver) {
    return {'name': driver.name, 'car': driver.car.toMap(driver.car)};
  }
}

class Car {
  String uid;
  String cid;
  int seatsNo;
  String type;
  String plateNumber;
  String color;

  Car({this.cid, this.color, this.plateNumber, this.type, this.seatsNo});

  Map<String, dynamic> toMap(Car car) {
    return {
      'color': car.color,
      'plateNo': car.plateNumber,
      'seatsNo': car.seatsNo,
      'type': car.type
    };
  }
}

class CurrentRides {
  String rid;
  User user;
  String from;
  String to;
  // String date;
  String time;
  String dateTime;
  String dateAdded;
  String date;
  int availableSeats;
  String genderPreference;
  double price;
  String note;
  String status;
  Driver driver;
  CurrentRides(
      {this.user,
      this.from,
      this.to,
      this.date,
      this.time,
      this.dateTime,
      this.dateAdded,
      this.availableSeats,
      this.genderPreference,
      this.price,
      this.note,
      this.status,
      this.driver}) {
    // this.dateAdded = ago(dateAdded);
  }

  String ago(String datetime) {
    DateTime tmp = DateFormat("yyyy-MM-dd hh:mm:ss").parse(datetime);
    return timeago.format(tmp);
  }
}
