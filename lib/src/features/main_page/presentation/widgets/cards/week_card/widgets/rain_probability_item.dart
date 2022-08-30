import 'package:flutter/material.dart';

class RainProbabilityItem extends StatelessWidget {
  const RainProbabilityItem({
    Key? key,
    required this.customIconColor,
    required this.customTextColor,
  }) : super(key: key);

  final Color customIconColor;
  final TextStyle customTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.water_drop, color: customIconColor, size: 13),
        const SizedBox(width: 3),
        Text('100%', style: customTextColor)
      ],
    );
  }
}
