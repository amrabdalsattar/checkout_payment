import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
  });

  final void Function()? onPressed;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60.sp,
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.darkGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.black,
                )
              : Text(
                  title,
                  style: Styles.medium19.copyWith(color: AppColors.black),
                ),
        ));
  }
}
