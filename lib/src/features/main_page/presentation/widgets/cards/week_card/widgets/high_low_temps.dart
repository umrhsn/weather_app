import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';

class HighLowTempsWidget extends StatelessWidget {
  final bool isCollapsed;

  const HighLowTempsWidget({Key? key, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customTextColor = AppColors.collapsedMediumTextStyle(context, isCollapsed);

    Padding _buildHighLowTempItem() {
      return Padding(
        padding: AppDimens.bottomMediumPadding,
        child: Row(children: [
          Text('34°', style: customTextColor),
          const SizedBox(width: 5),
          Text('24°', style: customTextColor)
        ]),
      );
    }

    return Column(
      children: [
        _buildHighLowTempItem(),
        _buildHighLowTempItem(),
        _buildHighLowTempItem(),
        _buildHighLowTempItem(),
        _buildHighLowTempItem(),
        _buildHighLowTempItem(),
        _buildHighLowTempItem(),
        _buildHighLowTempItem(),
      ],
    );
  }
}
