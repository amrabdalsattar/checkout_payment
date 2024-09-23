import '../../../../../../core/shared_widgets/custom_divider.dart';
import '../../../../../../core/shared_widgets/total_price.dart';
import '../../cart/custom_cart_widgets/order_info_item.dart';
import 'card_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import 'barcode_widget.dart';

class PaymentCompletionCard extends StatelessWidget {
  const PaymentCompletionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.ticketColor),
      child: Padding(
        padding: EdgeInsets.only(
          top: 50.h,
        ),
        child: Column(
          children: [
            Text(
              "Thank you!",
              style: Styles.medium25,
            ),
            Text(
              "Your transaction was successful",
              style: Styles.regular20,
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const OrderInfoItem(infoTitle: 'Date', value: '01/24/2023'),
                  SizedBox(
                    height: 17.h,
                  ),
                  const OrderInfoItem(infoTitle: 'Time', value: '10:15 AM'),
                  SizedBox(
                    height: 17.h,
                  ),
                  const OrderInfoItem(infoTitle: 'To', value: 'Sam Louis'),
                  SizedBox(height: 25.h),
                  const CustomDivider(dividerPercentageFromWidth: 0.83),
                  SizedBox(
                    height: 18.h,
                  ),
                  const TotalPrice(title: 'Total', value: '50,97'),
                ],
              ),
            ),
            const CardInfo(),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 35.h),
              child: const BarcodeWidget(),
            )
          ],
        ),
      ),
    );
  }
}
