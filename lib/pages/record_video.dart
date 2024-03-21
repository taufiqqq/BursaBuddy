// scanner.dart
import 'package:bijaktrade/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class RecordVideo extends StatefulWidget {
  const RecordVideo({Key? key}) : super(key: key);

  @override
  _RecordVideoState createState() => _RecordVideoState();
}

class _RecordVideoState extends State<RecordVideo> {
  late CameraController controller;
  bool isCameraInitialized = false;
  bool isLoading = false;

  late List<CameraDescription> _cameras;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    controller = CameraController(_cameras[0], ResolutionPreset.max);

    try {
      await controller.initialize();
      if (mounted) {
        setState(() {
          isCameraInitialized = true;
        });
      }
    } catch (e) {
      print('Error initializing camera: $e');
      // Handle the error accordingly
    }
  }

  // Function to show the loading indicator
  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing the dialog
      builder: (BuildContext context) {
        // Show the loading dialog
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('MediPet is confurguring...'),
            ],
          ),
        );
      },
    );

    // Automatically close the dialog after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  // Function to hide the loading indicator
  void hideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) {
      return Container(); // Or show a loading indicator
    }

    return WillPopScope(
      onWillPop: () async {
        // Dispose the camera controller when leaving the Scanner page
        controller.dispose();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to a new page using pushReplacement
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => WidgetTree()),
            );
          },
        ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: CameraPreview(controller),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 120, right: 20),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                        child: Icon(Icons.folder_copy, color: Colors.white, size: 50, shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 15.0)],),
                        onTap: () {
                          pickImage();
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> pickImage() async {
  final picker = ImagePicker();
  try {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // User has picked an image
      // You can handle the image file here
      print('Image picked: ${pickedFile.path}');
    } else {
      // User canceled the image picking
      print('Image picking canceled.');
    }
  } catch (e) {
    // Handle any errors that might occur during image picking
    print('Error picking image: $e');
  }
}
