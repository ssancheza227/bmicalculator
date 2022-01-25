import 'package:flutter/material.dart';
import 'colorTheme.dart';

class CardGender extends StatelessWidget {
  const CardGender({Key? key, required this.cardChild, required this.onPress})
      : super(key: key);

  final Widget cardChild;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: onPress,
            child: Expanded(
                child: Container(
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                    decoration: const BoxDecoration(
                        color: ColorsTheme.secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: cardChild))));
  }
}
