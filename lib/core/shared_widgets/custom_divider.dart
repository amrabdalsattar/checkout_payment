import '../utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double dividerPercentageFromWidth;
  const CustomDivider({super.key, required this.dividerPercentageFromWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * dividerPercentageFromWidth,
      child: const Divider(
        color: AppColors.liteGrey,
        thickness: 2,
        height: 0,
      ),
    );
  }
}
