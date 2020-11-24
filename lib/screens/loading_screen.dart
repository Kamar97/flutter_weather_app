import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_your_weather_app/services/weather.dart';
import '../screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

double latitudeLocation;
double longitudeLocation;
WeatherModel weather = new WeatherModel();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    var weatherdata = await weather.getWeatherLocation();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(LocationWeather: weatherdata);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
