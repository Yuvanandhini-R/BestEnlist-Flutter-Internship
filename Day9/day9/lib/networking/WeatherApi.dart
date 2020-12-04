import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class WeatherApi {
  WeatherApi._privateConstructor();

  static final WeatherApi _singleton = WeatherApi._privateConstructor();

  factory WeatherApi() {
    return _singleton;
  }

  Future<Map<String, dynamic>> getWeatherData(String q) async {
    // Create a free account in WeatherApi.com
    // and then replace `<Your_API_Key_Here>` with the api key provided by WeatherApi.com

    final queryParameters = {'key': '<Your_API_Key_Here>', 'q': q};
    final uri =
        Uri.https('api.weatherapi.com', '/v1/current.json', queryParameters);
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode >= 200 || response.statusCode <= 299) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data.');
    }
  }
}
