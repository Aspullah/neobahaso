import 'package:flutter/foundation.dart';

class ConfigEnvironment {
  static Map<String, dynamic>? _config;
  static Environment? environment;
  static const String apiKey = 'cc95d932d5a45d33a9527d5019475f2c';

  static void setEnvironment(Environment env) {
    environment = env;
    
    switch (env) {
      case Environment.TRIAL:
        _config = _Config.trialConstant;
        break;
      case Environment.DEV:
        _config = _Config.developmentConstant;
        break;
      case Environment.PRODUCTION:
        _config = _Config.productionConstant;
        break;

    }
  }

  static get URL => _config![_Config.URL];
  static get AUTH_URL => _config![_Config.AUTH_URL];
  static get BUILD_FLAVOR_TYPE => _config![_Config.BUILD_FLAVOR_TYPE];

  // TODO: Trial API Weather
  static String currentWeatherByName(String city) => _config![_Config.URL]+'/weather?q=$city&appid=$apiKey';
  static String weatherIcon(String iconCode) => 'http://openweathermap.org/img/wn/$iconCode@2x.png';

  // TODO: Auth Trial
  static get loginTrial => _config![_Config.AUTH_URL];

}

class _Config {
  static const URL = "URL";
  static const AUTH_URL = "AUTH_URL";
  static const BUILD_FLAVOR_TYPE = "BUILD_FLAVOR_TYPE";

  static Map<String, dynamic> trialConstant = {
    URL: "https://api.openweathermap.org/data/2.5",
    AUTH_URL: "https://reqres.in/api/login",
    BUILD_FLAVOR_TYPE: BuildFlavorType.TRIAL,
  };

  static Map<String, dynamic> developmentConstant = {
    URL: "https://dev.bahaso.com/api",
    AUTH_URL: "https://dev.bahaso.com/api",
    BUILD_FLAVOR_TYPE: BuildFlavorType.DEV
  };

  static Map<String, dynamic> productionConstant = {
    URL: "https://bahaso.com/api",
    AUTH_URL: "https://bahaso.com/api",
    BUILD_FLAVOR_TYPE: BuildFlavorType.PRODUCTION
  };
}

enum BuildFlavorType {TRIAL, DEV, PRODUCTION}
enum Environment {TRIAL, DEV,PRODUCTION}
