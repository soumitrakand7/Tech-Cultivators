import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:lottie/lottie.dart';

class Detection extends StatefulWidget {
  const Detection({Key? key}) : super(key: key);

  @override
  State<Detection> createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {
  bool diseaseDetected = false;
  File? imageFile;
  String disease = "";
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, "/Add_Product");
                  },
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Lottie.network(
                        "https://assets2.lottiefiles.com/packages/lf20_m1hurwli.json"),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: const Size(175, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    var imagefile = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (imagefile != null) {
                      List<int> imageBytes =
                          File(imagefile.path).readAsBytesSync();
                      String base64Image = base64Encode(imageBytes);
                      print(base64Image);
                      var body = json.encode({"data": base64Image});
                      var temp = {'Content-Type': 'application/json'};
                      var request = http.post(
                        Uri.parse(
                          'https://tech-cultivators-api.herokuapp.com/plant_disease',
                        ),
                        body: body,
                        headers: temp,
                      );
                      var response = await request;
                      print(response.body);
                      final result = jsonDecode(response.body);
                      disease = result["disease"];
                      diseaseDetected = true;
                      setState(() {});
                    }
                  },
                  child: const Text(
                    "Click Image",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                diseaseDetected
                    ? Text(
                        "Disease Detected: \n $disease",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

