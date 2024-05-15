import 'package:flutter/material.dart';

class WeatherDaysList extends StatelessWidget {
  const WeatherDaysList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Данные для четырех дней
    final List<Map<String, dynamic>> weatherData = [
      {
        'day': 'Monday',
        'icon': Image.asset(
          'assets/images/png/sun.png', // URL или локальный путь к изображению
          width: 24,
          height: 24,
        ),
        'temperature': '10°'
      },
      {
        'day': 'Tuesday',
        'icon': Image.asset(
          'assets/images/png/sun.png', // URL или локальный путь к изображению
          width: 24,
          height: 24,
        ),
        'temperature': '15°'
      },
      {
        'day': 'Wednesday',
        'icon': Image.asset(
          'assets/images/png/cloudy.png', // URL или локальный путь к изображению
          width: 24,
          height: 24,
        ),
        'temperature': '14°'
      },
      {
        'day': 'Thursday',
        'icon': Image.asset(
          'assets/images/png/rain.png', // URL или локальный путь к изображению
          width: 24,
          height: 24,
        ),
        'temperature': '14°'
      },
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white, // Задний фон белого цвета
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Устанавливаем минимальный размер
          children: List.generate(weatherData.length, (index) {
            final data = weatherData[index];
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data['day'],
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Center(child: data['icon']),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          data['temperature'],
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                if (index <
                    weatherData.length -
                        1) // Добавляем Divider, кроме последнего элемента
                  const Divider(
                    color: Color(0x1A010E82), // Цвет с прозрачностью 10%
                    thickness: 1, // Толщина линии разделителя
                  ),
                if (index == weatherData.length - 1)
                  const SizedBox(
                    height: 80, // Отступ для последнего элемента
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
