import 'package:day9/networking/WeatherApi.dart';
import 'package:flutter/cupertino.dart';

class WeatherStateModel extends ChangeNotifier {
  Future<Map<String, dynamic>> _weatherData;

  Future<Map<String, dynamic>> get weatherData => _weatherData;

  WeatherStateModel() {
    this.reloadData();
  }

  String _q = "Kanchipuram";

  String get q => _q;

  void setQ(String q) {
    _q = q;
    notifyListeners();
  }

  void reloadData() {
    _weatherData = WeatherApi().getWeatherData(q);
    notifyListeners();
  }
}
