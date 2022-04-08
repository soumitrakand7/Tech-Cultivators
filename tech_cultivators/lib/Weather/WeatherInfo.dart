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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                    controller: _cityTextController,
                    decoration: const InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _search();
                });
                myCity != null
                    ? Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Details(
                            humidity: humidity,
                            icon: icon,
                            myCity: myCity,
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
                    : const CircularProgressIndicator();
              },
              child: const Text('Search'),
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
    print(response.body);
    return await response;
  }
}
