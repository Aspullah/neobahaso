import 'dart:io';

import 'package:neobahaso/features/weather/data/datasources/remote_data_source.dart';
import 'package:neobahaso/utils/exception.dart';
import 'package:neobahaso/features/weather/domain/entities/weather.dart';
import 'package:neobahaso/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:neobahaso/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
