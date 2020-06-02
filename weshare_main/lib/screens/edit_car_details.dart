import 'package:flutter/material.dart';
import '../screens/constants.dart';

class EditCarDetails extends StatelessWidget {
  String carType;
  String carPlateNo;
  String carColor;
  String emptySeats;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  void _saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('✅ Your car information has been updated!'),
      ),
    );

    print(carType);
    print(carPlateNo);
    print(carColor);
    print(emptySeats);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF1F3F5),
      appBar: appBarBuilder('Edit Your Car Details', true, null),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              SizedBox(height: 45),
              Text(
                'Ensure that all your car details are correct. This information will assist your riders to find you easier and faster.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 65),
              Form(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Car Type:',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                      Material(
                        elevation: 2.0,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: TextFormField(
                          decoration: textInputDecoration,
                          validator: (type) =>
                              type.isEmpty ? 'Field Required!' : null,
                          onSaved: (newType) {
                            carType = newType;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Car Plate No.:',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                      Material(
                        elevation: 2.0,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: TextFormField(
                          decoration: textInputDecoration,
                          validator: (type) =>
                              type.isEmpty ? 'Field Required!' : null,
                          onSaved: (newCarNo) {
                            carPlateNo = newCarNo;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Car Color:',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14.0)),
                                Material(
                                  elevation: 2.0,
                                  shadowColor: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  child: TextFormField(
                                    decoration: textInputDecoration,
                                    validator: (type) =>
                                        type.isEmpty ? 'Field Required!' : null,
                                    onSaved: (newCarColor) {
                                      carColor = newCarColor;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Car Empty Seats:',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14.0)),
                                  Material(
                                    elevation: 2.0,
                                    shadowColor: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: TextFormField(
                                      decoration: textInputDecoration,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      validator: (type) => type.isEmpty
                                          ? 'Field Required!'
                                          : null,
                                      onSaved: (newCarSeatsNo) {
                                        emptySeats = newCarSeatsNo;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 5.5),
              Container(
                //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FlatButton(
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  onPressed: () {
                    _saveForm();
                  },
                  color: Color(0xFF5C79FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
