import 'package:dartz/dartz.dart';
import 'package:neobahaso/features/login/domain/entities/login.dart';
import 'package:neobahaso/utils/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> getAuthentication(String email, String password);
}