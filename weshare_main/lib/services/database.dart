import 'package:cloud_firestore/cloud_firestore.dart';
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
          from: doc.data['from'],
          to: doc.data['to'],
          dateAdded: doc.data['dateAdded'],
          dateTime: doc.data['dateTime'],
          price: doc.data['price'],
          seatsAvailable: doc.data['availableSeats'],
          driver: _driverFromSnapsoht(doc.data['driver'])
          );

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
          seatsAvailable: doc.data['availableSeats'],
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


  // Future joinRide(Ride ride, User user){
  //     return await usersCollection.document(uid).setData({      'name': user.name,
  //     'email': user.email,
  //     'phoneNumber': user.phoneNumber,
  //     'gender': user.gender,
  //   });
  // }


  List<CurrentRides> filterRides(List<CurrentRides> rides, String status) {
    List<CurrentRides> filtered = [];
    for (var item in rides) {
      if (item.status == status) {
        filtered.add(item);
      }
    }
    return filtered;
  }
}
