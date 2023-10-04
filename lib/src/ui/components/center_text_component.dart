import 'package:flutter/material.dart';

class CenterTextComponent extends StatelessWidget {
  final String text;
  const CenterTextComponent({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
