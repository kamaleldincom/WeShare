import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/screens/edit_car_details.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference ridesCollection =
      Firestore.instance.collection('rides');

  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  Future getRides() async {
    return await ridesCollection.getDocuments();
  }

  Future insertUser(User user) async {
    return await usersCollection.document(uid).setData({
      'name': user.name,
      'email': user.email,
      'phoneNumber': user.phoneNumber,
      'gender': user.gender,
      'isDriver': false,
    });
  }

  Driver _driverFromSnapsoht(Map<String, dynamic> data) {
    // print(data);
    return Driver(data);
  }

  Car _carFromSnapsoht(Map<String, dynamic> data) {
    // print(data);
    return Car(
        color: data['color'] == null ? "" : data['color'],
        type: data['type'] == null ? "" : data['type'],
        plateNumber: data['plateNo'] == null ? "" : data['plateNo'],
        seatsNo: data['seatsNo'] == null ? "" : data['seatsNo']);
  }

  List<Ride> _ridesListFromSnapshot(QuerySnapshot snapshot) {
    // List<Ride> rides;
    return snapshot.documents.map((doc) {
      Ride ride = Ride(
          rid: doc.documentID,
          from: doc.data['from'],
          to: doc.data['to'],
          dateAdded: doc.data['dateAdded'],
          dateTime: doc.data['dateTime'],
          did: doc.data['did'],
          riders: doc.data['riders'],
          price: doc.data['price'],
          availableSeats: doc.data['availableSeats'],
          status: doc.data['status'],
          driver: _driverFromSnapsoht(doc.data['driver']));
      // print("docdata: ${doc.documentID}");
      return ride;
    }).toList();
  }

  List<CurrentRides> _rodesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      CurrentRides ride = CurrentRides(
          from: doc.data['from'],
          to: doc.data['to'],
          dateAdded: doc.data['dateAdded'],
          dateTime: doc.data['dateTime'],
          riders: doc.data['riders'],
          price: doc.data['price'],
          did: doc.data['did'],
          availableSeats: doc.data['availableSeats'],
          status: doc.data['status'],
          driver: _driverFromSnapsoht(doc.data['driver']));
      return ride;
    }).toList();
  }

  Stream<List<CurrentRides>> userRides(var userType) {
    if (userType == 'Rider') {
      return usersCollection
          .document(uid)
          .collection('rides')
          .snapshots()
          .map(_rodesListFromSnapshot);
    }
    return usersCollection
        .document(uid)
        .collection('providedRides')
        .snapshots()
        .map(_rodesListFromSnapshot);
  }

  Stream<List<Ride>> get rides {
    return ridesCollection
        .where('status', isEqualTo: 'posted')
        .where('availableSeats', isGreaterThan: 0)
        // .where('rid', is)
        .snapshots()
        .map(_ridesListFromSnapshot);
  }

  Future joinRide(Ride ride, User user) async {
    ridesCollection
        .document(ride.rid)
        .updateData({"availableSeats": FieldValue.increment(-1)});
    usersCollection
        .document(user.uid)
        .collection('rides')
        .document(ride.rid)
        .setData(ride.toMap(ride));
  }

  List<CurrentRides> filterRides(List<CurrentRides> rides, String status) {
    List<CurrentRides> filtered = [];
    for (var item in rides) {
      if (item.status == status) {
        filtered.add(item);
      }
    }
    return filtered;
  }

  Future<User> getUserDetails(String uid) {
    return usersCollection.document(uid).get().then((doc) {
      return userFromSnapshots(doc);
    });
  }

  User userFromSnapshots(DocumentSnapshot snapshot) {
    Map<String, dynamic> data;
    User user = User(
        uid: snapshot.documentID,
        email: snapshot.data['email'],
        name: snapshot.data['name'],
        gender: snapshot.data['gender'],
        phoneNumber: snapshot.data['phoneNumber'],
        isDriver: snapshot.data['isDriver'],
        car: snapshot.data['isDriver']
            ? _carFromSnapsoht(snapshot.data['car'])
            : data);
    return user;
  }

  Future editCarDetails(Car car) async {
    return await usersCollection
        .document(uid)
        .updateData({'car': car.toMap(car), 'isDriver': true});
  }

  Future<bool> isDriver() async {
    return usersCollection
        .document(uid)
        .get()
        .then((doc) => doc.data['isDriver']);
  }

  Future provideRide(Ride ride, User user) async {
    ride.driver = Driver(user.toMap(user));

    ridesCollection.add(ride.toMap(ride)).then((value) {
      print('${value.documentID}');
      ride.rid = value.documentID;

      usersCollection
          .document(user.uid)
          .collection('providedRides')
          .document(ride.rid)
          .setData(ride.toMap(ride));
    });
  }
}
