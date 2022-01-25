import 'package:flutter/material.dart';
import 'colorTheme.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, required this.content, required this.onPress, required this.enabled})
      : super(key: key);

  final String content;
  final void Function() onPress;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: enabled ? onPress : null,
        child: Container(
            margin: const EdgeInsets.all(4),
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                color: ColorsTheme.thirdColor,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Center(
                child: Text(
              content,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ))));
  }
}
