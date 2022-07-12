import 'package:flutter/material.dart';
import 'package:neobahaso/app.dart';
import 'package:neobahaso/configs/app_config.dart';
import 'di/injection.dart' as di;

void main() {
  ConfigEnvironment.setEnvironment(Environment.TRIAL);
  di.init();
  runApp(MyApp());
}