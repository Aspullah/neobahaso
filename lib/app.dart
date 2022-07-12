import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobahaso/features/login/presentation/bloc/login_bloc.dart';
import 'package:neobahaso/features/login/presentation/pages/login_page.dart';
import 'package:neobahaso/features/splash/splash_page.dart';
import 'package:neobahaso/features/weather/presentation/bloc/weather_bloc.dart';
import 'di/injection.dart' as di;
import 'package:neobahaso/configs/routes.dart' as router;

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<WeatherBloc>()),
        BlocProvider(create: (_) => di.locator<LoginBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashPage.ROUTE,
        onGenerateRoute: router.generateRoute,
        home: LoginPage(),
      ),
    );
  }
}