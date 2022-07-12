import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neobahaso/features/login/presentation/pages/login_page.dart';
import 'package:neobahaso/features/weather/presentation/pages/weather_page.dart';

class SplashPage extends StatefulWidget {
  static const String ROUTE = "splash_page";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, LoginPage.ROUTE));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
