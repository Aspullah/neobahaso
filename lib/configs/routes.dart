import 'package:flutter/material.dart';
import 'package:neobahaso/features/login/presentation/pages/login_page.dart';
import 'package:neobahaso/features/splash/splash_page.dart';
import 'package:neobahaso/features/weather/presentation/pages/weather_page.dart';


Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.ROUTE:
        return MaterialPageRoute(builder: (context) => SplashPage());
    case LoginPage.ROUTE:
        return MaterialPageRoute(builder: (context) => LoginPage());
    case WeatherPage.ROUTE:
        return MaterialPageRoute(builder: (context) => WeatherPage());
  }
}
