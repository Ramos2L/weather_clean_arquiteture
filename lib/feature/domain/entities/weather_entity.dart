import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final String description;
  final double sensation;
  final double humidity;
  final double wind;

  const WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.description,
    required this.sensation,
    required this.humidity,
    required this.wind,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [cityName, temperature, mainCondition, description, sensation, humidity, wind,];

}
