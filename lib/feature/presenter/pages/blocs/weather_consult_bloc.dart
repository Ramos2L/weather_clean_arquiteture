import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/weather_entity.dart';
import '../../../domain/usescases/get_weather_data_from_city_usecase.dart';
import '../service/consult_city.dart';


part 'weather_consult_event.dart';

part 'weather_consult_state.dart';

class WeatherConsultBloc extends Bloc<WeatherConsultEvent, WeatherConsultState> {
  final GetWeatherDataFromCityUsecase _usecase;

  WeatherEntity? _weather;

  WeatherConsultBloc({required GetWeatherDataFromCityUsecase usecase})
      : _usecase = usecase,
        super(const WeatherConsultInitial()) {
    on<FetchWeather>(_consultWeather);
  }

  void _consultWeather(FetchWeather event, Emitter<WeatherConsultState> emit) async {
    emit(const WeatherConsultLoading());

    String cityName = await ConsultCity.getCurrencyCity();

    try {
      final weather = await _usecase(cityName);
      weather.fold((l) => emit(const WeatherConsultError(messageError: 'Ops algo deu errado')), (weather) {
        _weather = weather;
        emit(WeatherConsultSuccess(weather: weather));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(WeatherConsultError(messageError: e.toString()));
    }
  }
}