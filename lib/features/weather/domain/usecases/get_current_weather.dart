import 'package:dartz/dartz.dart';
import 'package:neobahaso/utils/failure.dart';
import 'package:neobahaso/features/weather/domain/entities/weather.dart';
import 'package:neobahaso/features/weather/domain/repositories/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, Weather>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
