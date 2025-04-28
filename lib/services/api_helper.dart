import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app_tutorial/constants/constants.dart';
import 'package:weather_app_tutorial/models/hourly_weather.dart';
import 'package:weather_app_tutorial/models/weather.dart';
import 'package:weather_app_tutorial/models/weekly_weather.dart';
import 'package:weather_app_tutorial/services/geolocator.dart';
import 'package:weather_app_tutorial/utils/logging.dart';

@immutable
class ApiHelper {
  static const openWeatherBaseUrl = 'https://api.openweathermap.org/data/2.5';
  static const openMeteoBaseUrl = 'https://api.open-meteo.com/v1/forecast';

  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();

  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructCurrentWeatherUrl();
    final response = await _fetchData(url);

    return Weather.fromJson(response);
  }

  static Future<HourlyWeather> getHourlyWeather() async {
    await fetchLocation();
    final url = _constructHourlyForecastUrl();
    final response = await _fetchData(url);

    return HourlyWeather.fromJson(response);
  }

  static Future<WeeklyWeather> getWeeklyWeather() async {
    await fetchLocation();
    final url = _constructWeeklyForecastUrl();
    final response = await _fetchData(url);

    return WeeklyWeather.fromJson(response);
  }

  static Future<Weather> getWeatherByCityName(
      {required String cityName}) async {
    final url = _constructWeatherByCityUrl(cityName);
    final response = await _fetchData(url);

    return Weather.fromJson(response);
  }

  // URL Builders
  static String _constructCurrentWeatherUrl() =>
      '$openWeatherBaseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructHourlyForecastUrl() =>
      '$openWeatherBaseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructWeatherByCityUrl(String cityName) =>
      '$openWeatherBaseUrl/weather?q=$cityName&units=metric&appid=${Constants.apiKey}';

  static String _constructWeeklyForecastUrl() =>
      '$openMeteoBaseUrl?latitude=$lat&longitude=$lon&daily=weathercode,temperature_2m_max,temperature_2m_min&timezone=auto';

  // Fetch data
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        printWarning('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data from $url: $e');
      throw Exception('Error fetching data');
    }
  }
}
