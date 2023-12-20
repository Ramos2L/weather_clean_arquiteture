import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_clean_arq/feature/data/datasource/weather_datasource.dart';
import 'package:weather_clean_arq/feature/data/models/weather_model.dart';
import 'package:weather_clean_arq/core/http_client/http_client.dart';


class WeatherMapDatasourceImpl implements WeatherDatasource {

  final HttpClient client;
  static String? BASE_URL = dotenv.env['BASE_URL'];
  final String api_key;

  WeatherMapDatasourceImpl(this.api_key,  {required this.client});

  @override
  Future<WeatherModel> getWeatherFromDataFromCity(String city) async {
    final response = await client.get('$BASE_URL?q=$city&appid=$api_key&units=metric');
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.data));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}