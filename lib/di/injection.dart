import 'package:neobahaso/features/login/data/datasources/login_remote_data_source.dart';
import 'package:neobahaso/features/login/data/repositories/login_repository_impl.dart';
import 'package:neobahaso/features/login/domain/repositories/login_repository.dart';
import 'package:neobahaso/features/login/domain/usecases/get_authentication.dart';
import 'package:neobahaso/features/login/presentation/bloc/login_bloc.dart';
import 'package:neobahaso/features/weather/data/datasources/remote_data_source.dart';
import 'package:neobahaso/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:neobahaso/features/weather/domain/repositories/weather_repository.dart';
import 'package:neobahaso/features/weather/domain/usecases/get_current_weather.dart';
import 'package:neobahaso/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //TODO: bloc
  locator.registerFactory(() => WeatherBloc(locator()));
  locator.registerFactory(() => LoginBloc(locator()));

  //TODO: usecase
  locator.registerLazySingleton(() => GetCurrentWeather(locator()));
  locator.registerLazySingleton(() => GetAuthentication(locator()));

  //TODO: repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  //TODO: data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  //TODO: external
  locator.registerLazySingleton(() => http.Client());
}
