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
          did: doc.data['did'],
          from: doc.data['from'],
          to: doc.data['to'],
          dateAdded: doc.data['dateAdded'],
          dateTime: doc.data['dateTime'],
          price: doc.data['price'],
          availableSeats: doc.data['availableSeats'],
          status: doc.data['status'],
          riders: doc.data['riders'],
          driver: _driverFromSnapsoht(doc.data['driver']));
      // print("docdata: ${doc.documentID}");
      return ride;
    }).toList();
  }

  List<CurrentRides> _rodesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      CurrentRides ride = CurrentRides(
          rid: doc.documentID,
          did: doc.data['did'],
          from: doc.data['from'],
          to: doc.data['to'],
          dateAdded: doc.data['dateAdded'],
          dateTime: doc.data['dateTime'],
          price: doc.data['price'],
          availableSeats: doc.data['availableSeats'],
          status: doc.data['status'],
          riders: doc.data['riders'],
          driver: _driverFromSnapsoht(doc.data['driver']));
      return ride;
    }).toList();
  }

  Stream<List<CurrentRides>> get userRides {
    return usersCollection
        .document(uid)
        .collection('rides')
        .snapshots()
        .map(_rodesListFromSnapshot);
  }

  Stream<List<CurrentRides>> get driverRides {
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
        // .where(uid, isEqualTo: false)
        .snapshots()
        .map(_ridesListFromSnapshot);
  }

  Future joinRide(Ride ride, User user) async {
    ride.riders = [user.uid];
    
    print('uid from joinRide: ${ride.riders[0]}');
    ride.riders.add(user.uid);
    ridesCollection
        .document(ride.rid)
        .updateData({"availableSeats": FieldValue.increment(-1),
                      "riders": FieldValue.arrayUnion([user.uid])});
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
      print('doc id : ${value.documentID}');
      ride.rid = value.documentID;

      usersCollection
          .document(user.uid)
          .collection('providedRides')
          .document(ride.rid)
          .setData(ride.toMap(ride));
    });
  }
  bool hasJoined(List riders,String uid){
    // * better to be done locally
    print(riders);
    bool joined = false;
    for (var item in riders) {
        if (item == uid) {
        return true;
        }
    }
    return joined;
  }

  Future<void> leaveRide(String rid,String uid) async {
  ridesCollection.document(rid).updateData({
                    "availableSeats": FieldValue.increment(1),
                    "riders": FieldValue.arrayRemove([uid])
                    });
        // print(uid);
        // print(rid);
        usersCollection.document(uid).collection('rides').document(rid).delete();
  }

}
