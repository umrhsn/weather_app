import 'package:flutter/material.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    // TODO: change icon to location_off according to location status
    return Row(children: [
      Text(
        'El Nady El Ahly',
        style: !isCollapsed
            ? const TextStyle(color: Colors.white)
            : Theme.of(context).textTheme.titleMedium,
      ),
      Icon(
        Icons.location_on,
        color: !isCollapsed ? Colors.white : Theme.of(context).iconTheme.color,
        size: !isCollapsed ? null : 18,
      )
    ]);
  }
}
