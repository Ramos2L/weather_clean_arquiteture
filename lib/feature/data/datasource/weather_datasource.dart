import '../models/weather_model.dart';

abstract class WeatherDatasource {
  Future<WeatherModel> getWeatherFromDataFromCity(String city);
}