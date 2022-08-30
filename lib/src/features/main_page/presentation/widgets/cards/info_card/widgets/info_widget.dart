import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;
  final String image;
  final String title;
  final String subtitle;

  const InfoWidget({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 40),
        const SizedBox(height: 8),
        Text(title),
        const SizedBox(height: 2),
        Text(subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400, color: Colors.grey)),
      ],
    );
  }
}
