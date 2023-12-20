import 'package:weather_clean_arq/feature/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required String cityName,
    required double temperature,
    required String mainCondition,
    required String description,
    required double sensation,
    required double humidity,
    required double wind,
  }) : super(
            cityName: cityName,
            temperature: temperature,
            mainCondition: mainCondition,
            description: description,
            sensation: sensation,
            humidity: humidity,
            wind: wind);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      sensation: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
    );
  }
}
