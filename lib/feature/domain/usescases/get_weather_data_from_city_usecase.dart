import 'package:dartz/dartz.dart';
import 'package:weather_clean_arq/core/errors/failures.dart';
import 'package:weather_clean_arq/core/usecases/usecase.dart';
import 'package:weather_clean_arq/feature/domain/entities/weather_entity.dart';
import 'package:weather_clean_arq/feature/domain/repositories/weather_repository.dart';

class GetWeatherDataFromCityUsecase implements UseCase<WeatherEntity, String> {
  final WeatherRepository repository;

  GetWeatherDataFromCityUsecase({required this.repository});

  @override
  Future<Either<Failure, WeatherEntity>> call(String city) async {
    return await repository.getWeatherDataFromCity(city);
  }
}