import 'package:flutter/material.dart';

class FeelsLikeText extends StatelessWidget {
  const FeelsLikeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      ' Feels like 34°',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
    );
  }
}
