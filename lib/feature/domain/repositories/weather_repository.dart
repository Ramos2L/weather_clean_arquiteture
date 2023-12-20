import 'package:dartz/dartz.dart';
import 'package:weather_clean_arq/feature/domain/entities/weather_entity.dart';

import '../../../core/errors/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherDataFromCity(String city);
}