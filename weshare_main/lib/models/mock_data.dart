import 'package:weshare_main/models/ride.dart';
import 'package:weshare_main/models/user.dart';

User user1 = User(name:'Ali qasimi',email:'Ali@gmail.com',password:'Ali*1234',phoneNumber:'+6023423523',photo: 'assets/person1.jpeg');
User user2 = User(name: 'Ibrahim Salim', email:'salim@hotmail.com', password:'Salim99', phoneNumber:'+60130001111', photo: 'assets/person2.jpeg');



List<Ride> rides = [Ride(user: user1 ,origin:'Desa Skudai Apartments',destination:'Electrical (FKE) P05',date:'02-05-2020',time:'7:43', seatsAvailable:3,genderPreference: 'Male',price: 2,note: ''),
                    Ride(user: user2 ,origin:'Melawis Apartments',destination:'School of Computing',date:'11-02-2020',time:'11:33', seatsAvailable:3,genderPreference: 'Female',price: 1.5,note: ''),
];


 