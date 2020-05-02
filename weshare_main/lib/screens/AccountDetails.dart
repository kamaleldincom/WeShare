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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Container(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  radius: 49,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 47,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/person.jpeg'),
                      radius: 45,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Title(
                  color: Colors.grey[300], 
                  child: Text(
                    "Ahmed Kamal Eldin",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Container(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  // obscureText: true,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                  initialValue: "+60 13-170 897",
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  // obscureText: true,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                  initialValue: "ahmed@kamaleldin.com",
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  // obscureText: true,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                  initialValue: "Desa Skudai Apartment,Jalan Sejahtera 15, ",
                ),
              ],
            ),
          ),
        ],
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