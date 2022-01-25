import 'package:bmicalculator/RoundButton.dart';
import 'package:bmicalculator/colorTheme.dart';
import 'package:flutter/material.dart';

class CardMeasure extends StatelessWidget {
  const CardMeasure(
      {Key? key,
      required this.title,
      required this.measure,
      required this.unit,
      required this.increment,
      required this.decrement,
      required this.enabled})
      : super(key: key);

  final String title;
  final int measure;
  final String unit;
  final void Function() increment;
  final void Function() decrement;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 16, color: Colors.white)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              measure.toString(),
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(unit,
                style: const TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              onPress: decrement,
              content: '-',
              enabled: enabled,
            ),
            RoundButton(
              onPress: increment,
              content: '+',
              enabled: enabled,
            )
          ],
        )
      ],
    );
  }
}
