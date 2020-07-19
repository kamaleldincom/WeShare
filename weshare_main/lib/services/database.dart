import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weshare_main/models/ride.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference ridesCollection =
      Firestore.instance.collection('rides');

  Future getRides() async {
    return await ridesCollection.getDocuments();
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


      print(ride.dateAdded);
      return ride;
    }).toList();
  }

  Stream<List<Ride>> get rides {
    return ridesCollection.snapshots().map(_ridesListFromSnapshot);
  }
}
