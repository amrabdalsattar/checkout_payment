import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/images.dart';
import '../../../../../../core/utils/styles.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.085,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset(Images.creditCardLogo),
        title: const Text('Credit Card'),
        titleTextStyle: Styles.regular15.copyWith(color: AppColors.black),
        subtitle: const Text('Mastercard **42'),
      ),
    );
  }
}
