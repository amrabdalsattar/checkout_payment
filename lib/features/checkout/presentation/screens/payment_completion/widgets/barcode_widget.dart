import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/styles.dart';

class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          FontAwesomeIcons.barcode,
          size: 80,
        ),
        Container(
          height: 50.h,
          width: 100.w,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              'Paid',
              style: Styles.semiBold24.copyWith(color: AppColors.darkGreen),
            ),
          ),
        )
      ],
    );
  }
}
