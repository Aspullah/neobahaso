import 'package:flutter/material.dart';
import 'package:neobahaso/core/widgets/shared_safe_area_widget.dart';
import 'package:neobahaso/features/login/presentation/widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  static const String ROUTE = "login_page";

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future<bool>.value(true);
      },
      child: SharedSafeAreaWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            alignment: Alignment.center,
            child: LoginWidget(),
          ),
        ),
      ), 
    );
  }
}