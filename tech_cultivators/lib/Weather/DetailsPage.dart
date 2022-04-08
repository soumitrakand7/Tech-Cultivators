import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  String? myCity;
  double? tempKelvin;
  double? tempCelsius;
  String? weather1;
  String? icon;
  double? speed;
  int? humidity;
  int? visibility;
  int? pressure;

  Details({
    Key? key,
    required this.myCity,
    required this.tempKelvin,
    required this.tempCelsius,
    required this.weather1,
    required this.icon,
    required this.speed,
    required this.humidity,
    required this.visibility,
    required this.pressure,
  }) : super(key: key);

  static String id = "Details";

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Humidity: " + widget.humidity.toString(),
            ),
            Text(
              "Pressure: " + widget.pressure.toString(),
            ),
            Text(
              "Temperature: " + widget.tempCelsius.toString(),
            ),
            Text(
              "Windspeed: " + widget.speed.toString(),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 8,
                left: 8,
                top: 8,
                bottom: 8,
              ),
              width: 110,
              height: 115,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/${widget.icon}@2x.png",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
