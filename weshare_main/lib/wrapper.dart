import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weshare_main/screens/authentication/Login.dart';
import 'package:weshare_main/screens/constants.dart';

import 'models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final user = Provider.of<User>(context);
    print(user);
    // return either home or authenticate widget
    if (user == null) { 
      return Login();
    }else{
      return BtmNavBar();

    }
  }
}  