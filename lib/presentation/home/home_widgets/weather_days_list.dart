import 'package:flutter/material.dart';

class WeatherDaysList extends StatelessWidget {
  const WeatherDaysList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Next 4 Days',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Пример списка с погодой на следующие дни
          Column(
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Day ${index + 1}: 20°C, Partly Cloudy',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
