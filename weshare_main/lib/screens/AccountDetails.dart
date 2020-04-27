import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F5),

      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xFFF1F3F5),
        leading: BackButton(
            color: Color(0xFF5C79FF),
        ),
          title: Text(
            'Account Details',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
      body: Column(
      ),
      floatingActionButton: Container(
        
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FlatButton(
          child: Text(
            'Save Changes',
            style: TextStyle(
                // fontFamily: 'SegoeUI',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          onPressed: () {
            // Navigator.pushNamed(context, '/login');
          },
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(horizontal: 123, vertical: 18),
        ),
      ),
    );
  }
}