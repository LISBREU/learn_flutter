import 'package:flutter/material.dart';

class WeatherToday extends StatelessWidget {
  const WeatherToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Обновлено
          children: [
            // Оберните изображение в столбец
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/png/sun.png', // URL или локальный путь к изображению
                  width: 200,
                  height: 300,
                ),
                const SizedBox(
                    height: 20), // Отступ между изображением и текстом
              ],
            ),
            const SizedBox(
                width: 20), // Отступ между изображением и колонкой текста
            // ignore: prefer_const_constructors
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ), // Отступ между иконкой и текстом
                    Text(
                      'Cupertino',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  '12°',
                  style: TextStyle(fontSize: 80, color: Colors.black),
                ),
                SizedBox(height: 5),
                Text(
                  'Sunny and bright',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        // Добавьте другие виджеты или элементы для отображения информации о погоде
      ],
    );
  }
}