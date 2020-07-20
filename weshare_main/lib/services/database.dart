import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';

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
    });
  }

  Driver _driverFromSnapsoht(Map<String, dynamic> data) {
    // print(data);
    return Driver(data);
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
          price: doc.data['price'],
          availableSeats: doc.data['availableSeats'],
          status: doc.data['status'],
          driver: _driverFromSnapsoht(doc.data['driver'])
          );
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
          price: doc.data['price'],
          availableSeats: doc.data['availableSeats'],
          status: doc.data['status'],
          driver: _driverFromSnapsoht(doc.data['driver'])
          );
      return ride;
    }).toList();
  }

  Stream<List<CurrentRides>> get userRides {
    return usersCollection.document(uid).collection('rides')
    .snapshots()
    .map(_rodesListFromSnapshot);
  }


  Stream<List<Ride>> get rides {
    return ridesCollection.where('status', isEqualTo: 'posted').where('availableSeats',isGreaterThan: 0).snapshots().map(_ridesListFromSnapshot);
  }

  Future joinRide(Ride ride, User user) async{

    ridesCollection.document(ride.rid).updateData({"availableSeats":FieldValue.increment(-1)});
    usersCollection.document(user.uid).collection('rides').document(ride.rid).setData(ride.toMap(ride));
    

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


  Future<User> getUserDetails(String uid){
    return 
    usersCollection.document(uid).get().then((doc){
      return userFromSnapshots(doc);
    });

    // return  usersCollection.document(uid);
    // document.get() => then((document) {
    // print(document("name"));
    // document.map();
  // });
  }

  User userFromSnapshots(DocumentSnapshot snapshot){
    
     User user = User(
        email: snapshot.data['email'],
        name: snapshot.data['name'],
        gender: snapshot.data['gender'],
        phoneNumber: snapshot.data['phoneNumber']
      );
      // print('user: ${user.email}');
    return user;
  }
  // User _userFromSnapshot(QuerySnapshot snapshot){
    
  //    User user = User(
  //       email: snapshot.data['email'],
  //       name: snapshot.data['name'],
  //       gender: snapshot.data['gender'],
  //       phoneNumber: snapshot.data['phoneNumber']
  //     );
  //     print('user: ${user.email}');
  //   return user;
  // }

}
