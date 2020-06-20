
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'driver_registeration.dart';

class CamerScreen extends StatefulWidget {
  @override
  _CamerScreenState createState() => _CamerScreenState();
}

class _CamerScreenState extends State<CamerScreen> {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  @override
void initState() {
  super.initState();
  // 1
  availableCameras().then((availableCameras) {
    
    cameras = availableCameras;
    if (cameras.length > 0) {
      setState(() {
        // 2
        selectedCameraIdx = 0;
      });

      _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
    }else{
      print("No camera available");
    }
  }).catchError((err) {
    // 3
    print('Error: $err.code\nError Message: $err.message');
  });
}

// 1, 2
Future _initCameraController(CameraDescription cameraDescription) async {
  if (controller != null) {
    await controller.dispose();
  }

  // 3
  controller = CameraController(cameraDescription, ResolutionPreset.high);

  // If the controller is updated then update the UI.
  // 4
  controller.addListener(() {
    // 5
    if (mounted) {
      setState(() {});
    }

    if (controller.value.hasError) {
      print('Camera error ${controller.value.errorDescription}');
    }
  });

  // 6
  try {
    await controller.initialize();
  } on CameraException catch (e) {
    // _showCameraException(e);
  }

  if (mounted) {
    setState(() {});
  }
}

Widget _cameraPreviewWidget() {
  if (controller == null || !controller.value.isInitialized) {
    return const Text(
      'Loading',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
}


Widget _cameraTogglesRowWidget() {
  if (cameras == null || cameras.isEmpty) {
    return Spacer();
  }

  CameraDescription selectedCamera = cameras[selectedCameraIdx];
  CameraLensDirection lensDirection = selectedCamera.lensDirection;

  return Expanded(
    child: Align(
      alignment: Alignment.centerLeft,
      child: FlatButton.icon(
          onPressed: _onSwitchCamera,
          icon: Icon(Icons.camera),
          label: Text(
              "${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1)}")),
    ),
  );
}


void _onSwitchCamera() {
  selectedCameraIdx =
  selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
  CameraDescription selectedCamera = cameras[selectedCameraIdx];
  _initCameraController(selectedCamera);
}


void _onCapturePressed(context) async {
  try {
    // 1
    final path = join(
      (await getTemporaryDirectory()).path,
      '${DateTime.now()}.png',
    );
    // 2
    await controller.takePicture(path);
    // 3
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DriverRegistration(path),
      ),
    );
  } catch (e) {
    print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        _cameraPreviewWidget(),
        
       FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Provide an onPressed callback.
        onPressed: () async {
         _onCapturePressed(context);
        },
      ),

      ],)
    );
    
    
  }
}


// class PreviewScreen extends StatefulWidget {
//   @override
//   _PreviewScreenState createState() => _PreviewScreenState();
// }

// class _PreviewScreenState extends State<PreviewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }


class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}



  // Navigator.push(
  //                                             context,
  //                                             new MaterialPageRoute(
  //                                                 builder: (BuildContext
  //                                                         context) =>
  //                                                     new CamerScreen()));