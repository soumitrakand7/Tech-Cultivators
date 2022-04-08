import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Detection extends StatefulWidget {
  const Detection({Key? key}) : super(key: key);

  @override
  State<Detection> createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: EdgeInsets.only(right: 1, left: 24),
          child: Text("Disease Detection",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              )),
        ),
        shape: RoundedRectangleBorder(
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
                margin:
                    EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 3),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/disease_detection.jpg"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Click Your Crop's picture and \n  find What's wrong with it",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, "/Add_Product");
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: Lottie.network(
                      "https://assets2.lottiefiles.com/packages/lf20_m1hurwli.json"),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
