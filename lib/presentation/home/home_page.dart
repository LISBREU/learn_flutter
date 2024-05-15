import 'package:flutter/material.dart';
import 'widgets/weather_today.dart';
import 'widgets/weather_days_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        // ignore: prefer_const_constructors
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
        ),
        leading: IconButton(
          icon: const Icon(Icons.near_me, color: Colors.indigo),
          iconSize: 32,
          onPressed: () {
            // Действие при нажатии на кнопку уведомлений
            print('Notifications button pressed');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.indigo),
            iconSize: 32,
            onPressed: () {
              // Действие при нажатии на кнопку поиска
              print('Search button pressed');
            },
          ),
        ],
      ),
      // ignore: prefer_const_constructors
      body: Column(
        children: [
          WeatherToday(), // Добавление виджета WeatherToday
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: WeatherDaysList(), // Добавление виджета WeatherDaysList
            ),
          ),
        ],
      ),
    );
  }
}
