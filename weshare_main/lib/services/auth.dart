// import 'package:
// ;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:weshare_main/models/user.dart';

class AuthService {
  final FirebaseAuth  _auth = FirebaseAuth.instance;

  User _userFormFirebaseUser(FirebaseUser user){
    return user != null ? User.signIn(uid:user.uid): null;
  }

  Stream<User> get user {
    // return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFormFirebaseUser(user)); //OR
    return _auth.onAuthStateChanged.map(_userFormFirebaseUser);
  }

 Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      print(result.user);
      return _userFormFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign up
  Future registerUser(String email, String password) async{
    try {
    AuthResult result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return _userFormFirebaseUser(user);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

 //sign out
  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  } 
}
