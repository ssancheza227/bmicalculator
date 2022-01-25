import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent(
      {Key? key,
      required this.icon,
      required this.title,
      required this.active})
      : super(key: key);

  final IconData icon;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: active
              ? Colors.white
              : Colors.white.withOpacity(0.4),
          size: 32,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: active
                  ? Colors.white
                  : Colors.white.withOpacity(0.4),
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
