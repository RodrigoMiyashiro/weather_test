import 'package:flutter/material.dart';
import 'package:wearther_test/src/ui/utils/text_style_utils.dart';

class Climate extends StatelessWidget {
  final double temperature;
  final String description;
  final String min;
  final String max;

  const Climate({
    super.key,
    required this.temperature,
    required this.description,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$temperature °C',
              style: TextStyleUtils.textStyleTemperature,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                description,
                style: TextStyleUtils.textStyleTemperatureComplements,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Min : $min ºC',
              style: TextStyleUtils.textStyleTemperatureComplements,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Max: $max ºC',
              style: TextStyleUtils.textStyleTemperatureComplements,
            ),
          ],
        ),
      ],
    );
  }
}
