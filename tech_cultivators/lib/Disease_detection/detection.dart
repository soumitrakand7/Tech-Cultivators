import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'dart:html';
import 'package:lottie/lottie.dart';

class Detection extends StatefulWidget {
  const Detection({Key? key}) : super(key: key);

  @override
  State<Detection> createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {
  XFile? _image;
  File? imageFile;

  String uploadCode = DateTime.now().hashCode.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: const EdgeInsets.only(right: 1, left: 24),
          child: const Text("Disease Detection",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              )),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      right: 10, left: 10, top: 10, bottom: 10),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 3),
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image:
                            AssetImage("assets/images/disease_detection.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                    "Click Your Crop's picture and \n  find What's wrong with it",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, "/Add_Product");
                  },
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Lottie.network(
                        "https://assets2.lottiefiles.com/packages/lf20_m1hurwli.json"
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Navigator.pop(context);
                    var imagefile = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (imagefile != null) {
                      if (mounted) {
                        setState(() {
                          _image = imagefile;
                        });
                      }
                      _cropImage(imagefile.path);
                      // await FirebaseStorage.instance
                      //     .ref("Images/$uploadCode")
                      //     .putFile(
                      //       File(imagefile.path),
                      //     );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cropImage(filePath) async {
    final File? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 128,
      maxHeight: 128,
    );
    if (croppedImage != null) {
      imageFile = croppedImage;
      setState(() {});
    }
  }
}
