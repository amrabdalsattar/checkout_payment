import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    this.isActive = false,
    required this.paymentMethodPath,
  });
  final bool isActive;
  final String paymentMethodPath;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 103 / 62,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: isActive ? AppColors.darkGreen : AppColors.midGrey,
                  width: 1.5),
              borderRadius: BorderRadius.circular(15)),
          shadows: isActive
              ? [
                  const BoxShadow(
                      color: AppColors.darkGreen,
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0)
                ]
              : null,
        ),
        child: FittedBox(child: Image.asset(paymentMethodPath)),
      ),
    );
  }
}
