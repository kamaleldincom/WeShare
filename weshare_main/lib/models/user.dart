

class User {
  String uid;
  String name;
  String email;
  String password;
  String phoneNumber;
  String gender;
  String photo;
  bool isDriver;


  User({this.name,this.email,this.gender,this.password,this.phoneNumber,this.photo,isDriver});
  User.signIn({this.uid});
  User.signUp({this.uid});

  // void addUser(){}
}