

import 'package:weshare_main/models/ride.dart';

class User{
  String uid;
  String name;
  String email;
  String password;
  String phoneNumber;
  String gender;
  bool photo;
  bool isDriver;
  Car car;

  User({this.uid,this.name,this.email,this.gender,this.password,this.phoneNumber,this.photo, this.isDriver, this.car});
  User.form({this.name,this.email,this.gender,this.password,this.phoneNumber,this.photo,isDriver});
  User.signIn({this.uid});
  User.signUp({this.uid});
  // User.driver({this.uid});
  User.driver(Map<String, dynamic> data) {
    this.name = data['name'];

    this.car = Car(
        // cid: data['car']['id'],
        plateNumber: data['car']['plateNo'],
        seatsNo: data['car']['seatsNo'],
        color: data['car']['color'],
        type: data['car']['type']
        );
  }
Map<String, dynamic> toMap(User user){

 
    return{
      'name': user.name,
      // 'email': user.email,
      // 'phoneNumber': user.phoneNumber,
      // 'gender': user.gender,
      'car': user.car.toMap(car),
      // 'photo': user.photo,
      // 'gender': user.gender,
    };
  }
  // void addUser(){}
}