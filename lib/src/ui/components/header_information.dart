import 'package:flutter/material.dart';
import 'package:wearther_test/src/ui/utils/text_style_utils.dart';
import 'package:wearther_test/src/ui/utils/widget_utils.dart';

class HeaderInformation extends StatelessWidget {
  final String cityName;
  final String countryCode;
  final String dateTime;
  final String hour;

  const HeaderInformation({
    super.key,
    required this.cityName,
    required this.countryCode,
    required this.dateTime,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cityName,
              style: TextStyleUtils.textStyleSemiBold,
            ),
            Text(
              ' /  $countryCode ',
              style: TextStyleUtils.textStyleSemiBold,
            ),
          ],
        ),
        Text(
          dateTime,
          style: TextStyleUtils.textStyleBold,
        ),
        Text(
          WidgetUtils.formatTime(hour),
          style: TextStyleUtils.textStyleBold,
        ),
      ],
    );
  }
}
