import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_clean_arq/feature/presenter/pages/blocs/weather_consult_bloc.dart';

import '../core/http_client/http_impl.dart';
import '../core/http_client/http_client.dart';
import 'data/datasource/weather_datasource.dart';
import 'data/datasource/weather_datasource_impl.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usescases/get_weather_data_from_city_usecase.dart';

///o bloc precis do usecase
///usecase precisa do repository
///repository precisa do datasource

final Provider<HttpClient> client = Provider<HttpClient>(
      (ref) => HttpImpl(),
);

final Provider<WeatherDatasource> datasource = Provider<WeatherDatasource>(
      (ref) => WeatherMapDatasourceImpl(client: ref.read(client), 'a9bf333019d9f229d5037da3b237749a'),
);

final Provider<WeatherRepository> repository = Provider<WeatherRepository>(
      (ref) => WeatherRepositoryImpl(datasource: ref.read(datasource)),
);

final Provider<GetWeatherDataFromCityUsecase> usecase = Provider<GetWeatherDataFromCityUsecase>(
      (ref) => GetWeatherDataFromCityUsecase( repository: ref.read(repository)),
);

final Provider<WeatherConsultBloc> weatherBloc = Provider<WeatherConsultBloc>(
  (ref) => WeatherConsultBloc(usecase: ref.read(usecase)),
);
