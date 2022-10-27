import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_forecast/searchPage.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String location = "Istanbul";

  double temp = 0;

  final String apiKey = '790da9ca6cee47352afca088f9fe64f3';

  var locationData;

  Future<void> getLocationWeather() async {
    locationData = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$location,tr&APPID=$apiKey&units=metric'));
    final locationDataParsed = jsonDecode(locationData.body);

    setState(() {
      temp = locationDataParsed['main']['temp'];
      location = locationDataParsed['name'];
    });
  }

  @override
  void initState() {
    getLocationWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/c.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    location,
                    style: TextStyle(fontSize: 70),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchPage()));
                      },
                      icon: const Icon(Icons.search, size: 40))
                ],
              ),
              Text(
                '$temp Cº',
                style: TextStyle(fontSize: 40),
              )
            ],
          ),
        ),
      ),
    );
  }
}
