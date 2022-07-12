import 'dart:convert';

import 'package:neobahaso/configs/app_config.dart';
import 'package:neobahaso/features/login/data/models/login_model.dart';
import 'package:neobahaso/utils/exception.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<LoginModel> getAuthentication(String email, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;
  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> getAuthentication(String email, String password) async {
    Map<String, String> headers = new Map();
    headers["Content-Type"] = "application/x-www-form-urlencoded; chartset=UTF-8";

    final res = await http.post(
      Uri.parse(ConfigEnvironment.loginTrial),
      headers: headers,
      body: <String, String>{'email': email, 'password': password},
    );

    if (res.statusCode == 200) {
      return LoginModel.fromJson(json.decode(res.body));
    } else {
      throw ServerException();
    }
  }
}
