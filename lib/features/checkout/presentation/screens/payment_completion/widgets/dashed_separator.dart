import '../../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DashedSeparator extends StatelessWidget {
  const DashedSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            20,
            (index) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 3),
                    height: 2,
                    color: AppColors.dashesColor,
                  ),
                )),
      ),
    );
  }
}
