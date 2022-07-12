import 'package:equatable/equatable.dart';

class Login extends Equatable {
  String? token;

  Login({
    this.token,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
