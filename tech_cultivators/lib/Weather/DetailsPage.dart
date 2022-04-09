// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Details extends StatefulWidget {
  String Location;
  String? myCity;
  double? tempKelvin;
  double? tempCelsius;
  String? weather1;
  String? icon;
  double? speed;
  int? humidity;
  int? visibility;
  int? pressure;
  int? sunrise;

  Details({
    Key? key,
    required this.Location,
    required this.myCity,
    required this.tempKelvin,
    required this.tempCelsius,
    required this.weather1,
    required this.icon,
    required this.speed,
    required this.humidity,
    required this.visibility,
    required this.pressure,
    required this.sunrise,
  }) : super(key: key);

  static String id = "Details";

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    List time = DateTime.fromMillisecondsSinceEpoch(
            int.parse(widget.sunrise.toString()))
        .toString()
        .split(" ");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 241, 197),
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
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Positioned(
              left: 50,
              child: Container(
                  width: 300,
                  child: Image(
                    image: AssetImage(
                      "assets/icons/${widget.icon}@2x.png",
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
            Text(
              widget.tempCelsius.toString().substring(0, 5) + "°",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.myCity.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Additional Information",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wind  : " + widget.speed.toString() + " Km/hr",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Humidity   : " + widget.humidity.toString() + "%",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pressure  : " + widget.pressure.toString() + " mbar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("Visibility   : " + widget.visibility.toString() + " m",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
// Stack(
//           children: [
//             Positioned(
//               left: 20,
//               top: 70,
//               child:
//             ),
//             Positioned(
//               top: 20,
//               left: 100,
//               child: Text(
//                 "Location : " + widget.myCity.toString(),
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             Positioned(
//                 left: 20,
//                 top: 300,
//                 child: Container(
//                   height: 200,
//                   width: 300,
//                   decoration: BoxDecoration(
//                     // color: Color.fromARGB(255, 192, 235, 215),

//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
                      
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "  Sunset:              " +
//                             time[1].toString().substring(0, 5) +
//                             " Pm",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "  Temperature:    " +
//                             widget.tempCelsius.toString().substring(0, 5) +
//                             " degree",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "  Windspeed:       " +
//                             widget.speed.toString() +
//                             " Km/hr",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "  Humidity:           " +
//                             widget.humidity.toString() +
//                             "%",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
// Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
           
//             Text(
//               "Pressure: " + widget.pressure.toString(),
//             ),
//             Text(
//               "Temperature: " + widget.tempCelsius.toString(),
//             ),
            
//             Text(
//               "Sunrise: " + time[1].toString(),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                 right: 8,
//                 left: 8,
//                 top: 8,
//                 bottom: 8,
//               ),
//               width: 110,
//               height: 115,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.white, width: 3),
//                 borderRadius: BorderRadius.circular(30),
//                 image: DecorationImage(
//                   image: AssetImage(
//                     "assets/icons/${widget.icon}@2x.png",
//                   ),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
