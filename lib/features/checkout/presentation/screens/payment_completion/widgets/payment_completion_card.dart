import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/shared_widgets/custom_divider.dart';
import '../../../../../../core/shared_widgets/total_price.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../cart/custom_cart_widgets/order_info_item.dart';
import 'barcode_widget.dart';
import 'card_info.dart';

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
                  OrderInfoItem(infoTitle: 'Date', value: pickTodayDate()),
                  SizedBox(
                    height: 17.h,
                  ),
                  OrderInfoItem(infoTitle: 'Time', value: pickHour()),
                  SizedBox(
                    height: 17.h,
                  ),
                  const OrderInfoItem(
                      infoTitle: 'To', value: 'Amr Abdelsattar'),
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

String pickTodayDate() {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  return "$day/$month/$year";
}

String pickHour() {
  return DateFormat('hh:mm a').format(DateTime.now());
}
