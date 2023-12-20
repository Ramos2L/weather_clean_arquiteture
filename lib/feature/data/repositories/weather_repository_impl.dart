import 'package:dartz/dartz.dart';
import 'package:weather_clean_arq/core/errors/failures.dart';
import 'package:weather_clean_arq/feature/data/datasource/weather_datasource.dart';
import 'package:weather_clean_arq/feature/domain/entities/weather_entity.dart';
import 'package:weather_clean_arq/feature/domain/repositories/weather_repository.dart';

import '../../../core/errors/exceptions.dart';

class WeatherRepositoryImpl implements WeatherRepository {

  final WeatherDatasource datasource;

  WeatherRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherDataFromCity(String city) async {
    try {
      final result = await datasource.getWeatherFromDataFromCity(city);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}