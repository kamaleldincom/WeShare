import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';
// import 'package:weshare_main/screens/edit_car_details.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      'photo': false,
    });
  }

  Future updateUserdetails(User user) async {
    await usersCollection.document(user.uid).updateData({
      'name': user.name,
      'phoneNumber': user.phoneNumber,
    });

    if (user.isDriver) {
      //  await ridesCollection.where('did', isEqualTo: user.uid).snapshots().forEach((element) {
      //     element.documents.forEach((element) {
      //       element.reference.updateData(<String, dynamic>{
      //           'driver': {
      //             'name': user.name,
      //             'car': user.car.toMap(user.car)
      //           }
      //       });
      //     });
      //   });

      //    await usersCollection.document(user.uid).collection('providedRides').snapshots().forEach((element) {
      //     element.documents.forEach((element) {
      //       element.reference.updateData(<String, dynamic>{
      //           'driver': {
      //             'name': user.name,
      //             'car': user.car.toMap(user.car)
      //           }
      //       });
      //     });
      //   });
    }

    // ridesCollection.where('did', isEqualTo: user.uid).snapshots().map((event) {
    //   event.documents.forEach((element) {
    //     element.reference.updateData(<String, dynamic>{
    //         'from': 'melawis'
    //     });
    //   });
    // });
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
        riders: doc.data['riders'],
        price: doc.data['price'],
        availableSeats: doc.data['availableSeats'],
        status: doc.data['status'],
        driver: _driverFromSnapsoht(doc.data['driver']),
        note: doc.data['note'],
      );
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
          riders: doc.data['riders'],
          price: doc.data['price'],
          availableSeats: doc.data['availableSeats'],
          status: doc.data['status'],
          driver: _driverFromSnapsoht(doc.data['driver']));
      return ride;
    }).toList();
  }

  Stream<List<CurrentRides>> userRides(var userType) {
    // print('Iam $userType');
    if (userType == 'Rider') {
      //print('Im rider');
      return usersCollection
          .document(uid)
          .collection('rides')
          .snapshots()
          .map(_rodesListFromSnapshot);
    } else {
      // print('Im driver');
      return usersCollection
          .document(uid)
          .collection('providedRides')
          .snapshots()
          .map(_rodesListFromSnapshot);
    }
  }

  Stream<List<Ride>> get rides {
    return ridesCollection
        .where('status', isEqualTo: 'posted')
        .where('availableSeats', isGreaterThan: 0)
        .snapshots()
        .map(_ridesListFromSnapshot);
  }

  Future joinRide(Ride ride, User user) async {
    // ride.riders = [user.uid];
    print(user.uid);
    print(ride.rid);

    // print('uid from joinRide: ${ride.riders[0]}');
    ride.riders.add(user.uid);
    ridesCollection.document(ride.rid).updateData({
      "availableSeats": FieldValue.increment(-1),
      "riders": FieldValue.arrayUnion([user.uid])
    });

    usersCollection
        .document(ride.did)
        .collection('providedRides')
        .document(ride.rid)
        .updateData({
      "availableSeats": FieldValue.increment(-1),
      "riders": FieldValue.arrayUnion([user.uid])
    });
    usersCollection
        .document(user.uid)
        .collection('rides')
        .document(ride.rid)
        .setData(ride.toMap(ride));
  }

  List<CurrentRides> filterRides(List<CurrentRides> rides, String status) {
    List<CurrentRides> filtered = [];
    if (status == 'current') {
      for (var item in rides) {
        if (item.status == 'posted' || item.status == 'started') {
          filtered.add(item);
        }
      }
    } else if (status == 'history') {
      for (var item in rides) {
        if (item.status == 'completed') {
          filtered.add(item);
        }
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
        photo: snapshot.data['photo'],
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

  bool hasJoined(List riders, String uid) {
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

  Future<void> leaveRide(CurrentRides ride, String uid) async {
    ridesCollection.document(ride.rid).updateData({
      "availableSeats": FieldValue.increment(1),
      "riders": FieldValue.arrayRemove([uid])
    });

    usersCollection
        .document(ride.did)
        .collection('providedRides')
        .document(ride.rid)
        .updateData({
      "availableSeats": FieldValue.increment(1),
      "riders": FieldValue.arrayRemove([uid])
    });
    usersCollection
        .document(uid)
        .collection('rides')
        .document(ride.rid)
        .delete();
  }

  Future<void> startRide(CurrentRides ride, String uid) async {
    //  ride.riders.add(user.uid);
    ridesCollection.document(ride.rid).updateData({
      "status": "started",
    });
    usersCollection
        .document(uid)
        .collection('providedRides')
        .document(ride.rid)
        .updateData({
      "status": "started",
    });
    List riders = await ridesCollection
        .document(ride.rid)
        .get()
        .then((doc) => doc.data['riders']);
    for (var rider in riders) {
      usersCollection
          .document(rider)
          .collection('rides')
          .document(ride.rid)
          .updateData({
        "status": "started",
      });
    }
  }

  Future cancelRide(CurrentRides ride, String uid) async {
    List riders = await ridesCollection
        .document(ride.rid)
        .get()
        .then((doc) => doc.data['riders']);
    ridesCollection.document(ride.rid).delete();
    usersCollection
        .document(uid)
        .collection('providedRides')
        .document(ride.rid)
        .delete();
    for (var rider in riders) {
      usersCollection
          .document(rider)
          .collection('rides')
          .document(ride.rid)
          .delete();
    }
  }

  Future endRide(CurrentRides ride, String uid) async {
    ridesCollection.document(ride.rid).updateData({
      "status": "completed",
    });
    usersCollection
        .document(uid)
        .collection('providedRides')
        .document(ride.rid)
        .updateData({
      "status": "completed",
    });
    List riders = await ridesCollection
        .document(ride.rid)
        .get()
        .then((doc) => doc.data['riders']);
    for (var rider in riders) {
      usersCollection
          .document(rider)
          .collection('rides')
          .document(ride.rid)
          .updateData({
        "status": "completed",
      });
    }
  }

  Future<Image> getImage(String image) async {
    Image m;
    await FirebaseStorage.instance
        .ref()
        .child('$image/profile.png')
        .getDownloadURL()
        .then((downloadUrl) {
      print(downloadUrl.toString());
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });

    return m;
  }

  Future updateUserProfilePicture(String uid) {
    usersCollection.document(uid).updateData({'photo': true});
  }

  Future<List<User>> getMyRiders(CurrentRides ride) async {
    List<User> users = [];
    List myRidersId = await ridesCollection
        .document(ride.rid)
        .get()
        .then((doc) => doc.data['riders']);

    for (var rider in myRidersId) {
      users.add(await usersCollection.document(rider).get().then((doc) {
        return userFromSnapshots(doc);
      }));
    }

    return users;
  }
}
