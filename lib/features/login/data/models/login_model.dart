import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:neobahaso/features/login/domain/entities/login.dart';

class LoginModel extends Equatable {
  final String token;

  const LoginModel({
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(token: json['token']);

  Map<String, dynamic> toJson() => {"token" : token};

  Login toEntity() => Login(token: token);

  List<Object?> get props => [token]; 
}
