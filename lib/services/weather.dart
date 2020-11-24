import 'package:flutter/material.dart';

import '../services/location.dart';
import '../services/networking.dart';

class WeatherModel {
  var apikey = 'd3783aecbb754d12f2db7f08b681c1d0';
  var OpenWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getCityWeather({String cityName}) async {
    var url =
        'api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=$apikey&units=metric';

    NetworkHelper networkHelper = new NetworkHelper(url: url);
    var apidata = await networkHelper.getApi();
    return apidata;
  }

  Future<dynamic> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url =
        '$OpenWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric';

    NetworkHelper networkHelper = new NetworkHelper(url: url);
    var apidata = await networkHelper.getApi();
    return apidata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
