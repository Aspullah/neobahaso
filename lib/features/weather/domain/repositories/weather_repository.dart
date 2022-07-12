import 'package:dartz/dartz.dart';
import 'package:neobahaso/utils/failure.dart';
import 'package:neobahaso/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}
