import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:neobahaso/features/login/data/datasources/login_remote_data_source.dart';
import 'package:neobahaso/features/login/domain/entities/login.dart';
import 'package:neobahaso/features/login/domain/repositories/login_repository.dart';
import 'package:neobahaso/utils/exception.dart';
import 'package:neobahaso/utils/failure.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<Either<Failure, Login>> getAuthentication(String email, String password) async {
    try {
      final result = await remoteDataSource.getAuthentication(email, password);
      // print(result);
      return Right(result.toEntity());
    } on ServerException{
      print("server failure");
      return const Left(ServerFailure(""));
    } on SocketException{
      print("connection failure");
      return const Left(ConnectionFailure("Failed to connect to the network"));
    }
  }
}