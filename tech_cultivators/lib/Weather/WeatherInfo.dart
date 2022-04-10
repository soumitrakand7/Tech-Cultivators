import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:kisan/Weather/DetailsPage.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<String> City = [
    'Ahmednagar',
    'Akola',
    'Amravati',
    'Aurangabad',
    'Bhandara',
    'Beed',
    'Buldhana',
    'Chandrapur',
    'Dhule',
    'Gadchiroli',
    'Gondia',
    'Hingoli',
    'Jalgaon',
    'Jalna',
    'Kolhapur',
    'Latur',
    'Mumbai City',
    'Mumbai suburban',
    'Nandurbar',
    'Nanded',
    'Nagpur',
    'Nashik',
    'Osmanabad',
    'Parbhani',
    'Pune',
    'Raigad',
    'Ratnagiri',
    'Sindhudurg',
    'Sangli',
    'Solapur',
    'Satara',
    'Thane',
    'Wardha',
    'Washim',
    'Yavatmal',
  ];

  bool isLoading = false;
  String? myCity;
  double? tempKelvin;
  double? tempCelsius;
  String? weather1;
  String? icon;
  double? speed;
  int? humidity;
  int? sunrise;
  int? visibility;
  int? pressure;
  final _cityTextController = TextEditingController();
  var SelectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: const EdgeInsets.only(right: 1, left: 24),
          child: const Text("Select City",
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
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 300,
                    child: DropdownButton(
                      hint: Text("Select your Shop",
                          style: TextStyle(fontSize: 18)),
                      value: SelectedCity,
                      dropdownColor: Color.fromARGB(255, 197, 243, 206),
                      elevation: 20,
                      isExpanded: true,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      icon: Icon(
                        Icons.arrow_drop_down_circle_sharp,
                        size: 30,
                      ),
                      onChanged: (newValueSelected) {
                        setState(() {
                          SelectedCity = newValueSelected.toString();
                        });
                      },
                      items: City.map((Nursary) {
                        return DropdownMenuItem(
                          value: Nursary,
                          child: Text(
                            Nursary,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 150,
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                        _search();
                      });
                      myCity != null
                          ? Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => Details(
                                  Location: _cityTextController.toString(),
                                  humidity: humidity,
                                  icon: icon,
                                  myCity: SelectedCity,
                                  pressure: pressure,
                                  speed: speed,
                                  sunrise: sunrise,
                                  tempCelsius: tempCelsius,
                                  tempKelvin: tempKelvin,
                                  visibility: visibility,
                                  weather1: weather1,
                                ),
                              ),
                            )
                          : CircularProgressIndicator();
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Search City",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<WeatherDetails> _search() async {
    final weather = WeatherDetails();
    await weather.getWeather(_cityTextController.text);
    setState(() {
      myCity = weather.myCity;
      tempKelvin = weather.tempKelvin;
      tempCelsius = weather.tempCelsius;
      weather1 = weather.weather1;
      icon = weather.icon;
      sunrise = weather.sunrise;
      speed = weather.speed;
      humidity = weather.humidity;
      visibility = weather.visibility;
      pressure = weather.pressure;
    });
    isLoading = false;
    return weather;
  }
}

class WeatherDetails {
  String? myCity;
  double? tempKelvin;
  double? tempCelsius;
  String? weather1;
  String? icon;
  double? speed;
  int? sunrise;
  int? humidity;
  int? visibility;
  int? pressure;
  var response;

  getWeather(String city) async {
    print(city);
    final queryParameters = {
      'q': city,
      'appid': 'ba3103a4039c4569be39cb4879e5087d'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    response = await http.get(uri);
    final json = jsonDecode(response.body);
    myCity = json['name'];
    tempKelvin = double.parse(json['main']['temp'].toString());
    tempCelsius = tempKelvin! - 273.12;
    weather1 = json['weather'][0]['main'];
    icon = json['weather'][0]['icon'];
    speed = json['wind']['speed'];
    humidity = json['main']['humidity'];
    visibility = json['visibility'];
    pressure = json['main']['pressure'];
    sunrise = json['sys']['sunrise'];

    return await response;
  }
}
