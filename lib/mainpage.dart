import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_forecast/searchPage.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatelessWidget {
  String location = "Ankara";
  double temp = 0;
  final String apiKey = 'b16ca46383c5be7ffc134fefdae0ac48';
  var locationData;

  Future<void> getLocationWeather() async {
    locationData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location,uk&appid=$apiKey'));
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
              ElevatedButton(
                  onPressed: (() async {
                    await locationData();
                    print(locationData);
                  }),
                  child: Text('Hava')),
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
                '$temp',
                style: TextStyle(fontSize: 40),
              )
            ],
          ),
        ),
      ),
    );
  }
}
