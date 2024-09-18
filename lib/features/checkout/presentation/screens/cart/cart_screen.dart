import 'package:checkout_payment/core/utils/app_router.dart';
import 'package:checkout_payment/features/checkout/presentation/screens/payment_details/payment_details_screen.dart';

import '../../../../../core/shared_widgets/custom_app_bar.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/custom_divider.dart';
import '../../../../../core/shared_widgets/total_price.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/images.dart';
import 'custom_cart_widgets/order_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: 'My Cart',
        isFirstScreen: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                Images.cart,
              ),
            ),
            SizedBox(
              height: 24.sp,
            ),
            const OrderInfoItem(infoTitle: 'Order Subtotal', value: 42.97),
            const OrderInfoItem(infoTitle: 'Discount', value: 0),
            const OrderInfoItem(infoTitle: 'Shipping', value: 8),
            SizedBox(
              height: 16.h,
            ),
            const CustomDivider(
              dividerPercentageFromWidth: 0.83,
            ),
            SizedBox(
              height: 13.h,
            ),
            const TotalPrice(),
            SizedBox(
              height: 14.h,
            ),
            CustomButton(
              title: 'Complete Payment',
              onPressed: () {
                AppRouter.navigationWithSlide(
                    context, const PaymentDetailsScreen());
              },
            ),
            SizedBox(
              height: 10.sp,
            )
          ],
        ),
      ),
    );
  }
}
