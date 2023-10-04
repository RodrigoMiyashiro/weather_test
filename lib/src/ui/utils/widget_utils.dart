import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetUtils {
  static Future<T> showModalUtils<T>(
    BuildContext context,
    Widget child,
  ) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: child,
      ),
    );
  }

  static String formatTime(String hour) {
    final parsedTime = DateTime.parse(hour).toLocal();
    final formattedTime = DateFormat('HH:mm').format(parsedTime);
    return formattedTime;
  }
}
