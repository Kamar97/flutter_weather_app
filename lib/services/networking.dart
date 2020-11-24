import 'package:flutter_your_weather_app/screens/loading_screen.dart';

import '../services/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/location.dart';

class NetworkHelper {
  NetworkHelper({this.url});
  final url;
  Future getApi() async {
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
