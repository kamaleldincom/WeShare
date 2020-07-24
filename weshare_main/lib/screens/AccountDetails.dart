import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weshare_main/models/user.dart';
import 'package:weshare_main/services/database.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

class AccountDetails extends StatefulWidget {
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {

  final _formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  String name= '';
  String phoneNumber= '';

  //  File imageFile;

  // /// Cropper plugin


  // /// Select an image via gallery or camera
  // Future<void> _pickImage(ImageSource source) async {
  //   // File selected ;
  //   return await ImagePicker.pickImage(source: source);

  //   // setState(() {
  //   //   imageFile = selected;
  //   // });
  // }

  /// Remove image
  // void _clear() {
  //   setState(() => imageFile = null);
  // }
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return GestureDetector(
      onTap: () =>
          FocusScope.of(context).requestFocus(new FocusNode()),
          child: Scaffold(
            key: _scaffold,
        resizeToAvoidBottomPadding: false,
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
          body: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                       child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    InkWell(
                        onTap: () async{
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ImageCapture(1)));
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).accentColor,
                          radius: 49,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 47,
                            child: FutureBuilder(
                future: DatabaseService().getImage(user.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                        ConnectionState.done)
                    return CircleAvatar(
                        child: ClipOval(
                          child:snapshot.data,
                        ),
                              // backgroundImage: NetworkImage(snapshot.data.preview),
                              radius: 45,
                            );

                  if (snapshot.connectionState ==
                        ConnectionState.waiting)
                    return Container(
                          height: MediaQuery.of(context).size.height /
                              1.25,
                          width: MediaQuery.of(context).size.width /
                              1.25,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,

                              strokeWidth: 4,
                          ));

                  if (snapshot.connectionState ==
                        ConnectionState.none) {
                    
                  return Container(
                    child: Icon(Icons.person),
                  );
                  }
                  return Container(
                    child: Icon(Icons.person),
                  );
                },
              ),
                          ),
                        ),
                    ),
                    SizedBox(
                        height: 20,
                    ),
                   



                    FutureBuilder(
              future: DatabaseService().getUserDetails(user.uid),
              builder: (BuildContext context,snapshot) {

                if (snapshot.hasData){
                    user= snapshot.data;
                
              return Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                     Title(
                    
                        color: Colors.grey[300], 
                        child: Text(
                          "${user.name}",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                    
                    
                    TextFormField(
                        // obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        initialValue: "${user.name}",
                        onChanged: (val){
                        name = val;
                        },
                        validator: (val) =>
                                  val.isEmpty ? 'Enter an Name' : null,
                    ),
                    TextFormField(
                        // obscureText: true,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                        ),
                        initialValue: "${user.phoneNumber}",
                        validator: (val) =>
                        val.isEmpty ? 'Enter an a phone number' : null,
                        onChanged: (val){
                         phoneNumber = val;
                        },
                    ),
                  
                  
                  
                  
                  
                    SizedBox(
                        height: 15,
                    ),
                    
                    SizedBox(
                        height: 15,
                    ),
                    // TextFormField(
                    //   // obscureText: true,
                    //   decoration: InputDecoration(
                    //     // border: OutlineInputBorder(),
                    //     labelText: 'Address',
                    //   ),
                    //   initialValue: "Desa Skudai Apartment,Jalan Sejahtera 15, ",
                    // ),
                  ],
                ),
              );
                }
            return Container(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                                  strokeWidth: 2,
                              ),
              ),
            );
              }
              ),
              
                  ],
                ),
              ),
              
              
        Container(
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
                 if (_formKey.currentState.validate() && name != '' || phoneNumber != '' ) {
                   user.phoneNumber = phoneNumber;
                   user.name = name;
                  //  print('name: $name');
                    DatabaseService().updateUserdetails(user);
                    SnackBar registrationBar = SnackBar(
                                                    content: Text(
                                                      'The changes you made will be reflected the next time you open the this page',
                                                    ),
                                                  );
                                                _scaffold.currentState.showSnackBar(registrationBar);
                 }
              },
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12)),
              padding: EdgeInsets.symmetric(horizontal: 123, vertical: 18),
            ),
            ),
   
            ],
            ),
                      ),
          ),
           ),
    );
  }
}





class ImageCapture extends StatefulWidget {
  createState() => _ImageCaptureState();
  // String u;
  // ImageCapture(this.u);
  File imageFile;
  int s;

  ImageCapture([this.s]);

}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  
  /// Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        cropStyle: CropStyle.circle,
        sourcePath: widget.imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
              ]:[
                CropAspectRatioPreset.square,
              ],
              
              // androidUiSettings: [

              // ]
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        // toolbarColor: Colors.purple,
        // toolbarWidgetColor: Colors.white,
        // toolbarTitle: 'Crop It'
        );


    setState(() {
      widget.imageFile = cropped ?? widget.imageFile;
    });
  }

  /// Select an image via gallery or camera
  Future<void> pickImg(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    widget.s =0;
    setState(() {
      widget.imageFile = selected;
    _cropImage();
    });
  }

  /// Remove image
  void _clear() {
    setState(() => widget.imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
      // print(' file :${widget.u}');
      if(widget.s == 1)
    pickImg(ImageSource.camera);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.photo_camera,
                size: 30,
              ),
              onPressed: () {
                widget.s =0;
               pickImg(ImageSource.camera, );
              },
              color: Colors.blue,
            ),
            ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (widget.imageFile != null) ...[
            Container(
                padding: EdgeInsets.all(32), child: Image.file(widget.imageFile)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  color: Colors.white,
                  child: Icon(Icons.crop,
                  // color: Colors.white,
                  ),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  color: Colors.pink,
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Uploader(
                file: widget.imageFile,
              ),
            )
          ]
        ],
      ),
    );
  }
}

/// Widget used to handle the management of
class Uploader extends StatefulWidget {
  final File file;

  Uploader({Key key, this.file}) : super(key: key);

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://weshare-5df01.appspot.com');

  StorageUploadTask _uploadTask;


  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
  _startUpload() {
    String filePath = '${user.uid}/profile.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;
                  
       if (_uploadTask.isComplete)
       Navigator.pop(context);
      DatabaseService().updateUserProfilePicture(user.uid);

            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // if (_uploadTask.isComplete)
                    // Text('',
                    //     style: TextStyle(
                    //         color: Colors.greenAccent,
                    //         height: 2 )),
                  LinearProgressIndicator(value: progressPercent),
                  Text(
                    '${(progressPercent * 100).toStringAsFixed(2)} % ',
                    style: TextStyle(fontSize:20),
                  ),
                ]);
          });
    } else {
      return FlatButton.icon(
          color: Colors.blue,
          label: Text('Save!'),
          icon: Icon(Icons.cloud_upload),
          onPressed: _startUpload);
    }
  }
}
