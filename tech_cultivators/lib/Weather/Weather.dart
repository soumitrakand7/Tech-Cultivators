import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: const EdgeInsets.only(right: 1, left: 24),
          child: const Text("Weather",
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
        child: Stack(
          children: [
            Positioned(
              left: 100,
              top: 80,
              child: Container(
                width: 300,
                child: Lottie.network(
                    "https://assets2.lottiefiles.com/packages/lf20_kljxfos1.json",
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: Column(
                children: const [
                  Text(
                    "Location:",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sunrise:",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sunset:",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
