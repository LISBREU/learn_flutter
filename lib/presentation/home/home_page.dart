import 'package:flutter/material.dart';
import 'home_widgets/weather_today.dart';
import 'home_widgets/weather_days_list.dart';

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
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
        ),
        leading: IconButton(
          icon: const Icon(Icons.near_me, color: Colors.indigo),
          onPressed: () {
            // Действие при нажатии на кнопку уведомлений
            print('Notifications button pressed');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.indigo),
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
          WeatherDaysList(),
        ],
      ),
    );
  }
}
