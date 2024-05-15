import 'package:flutter/material.dart';
import 'package:namer_application/presentation/home/home_page.dart';
import 'package:namer_application/resources/strings.dart';
import 'package:namer_application/theme/weather_theme.dart';


class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: Strings.appName,
        theme: WeatherTheme.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}