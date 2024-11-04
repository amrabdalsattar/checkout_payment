import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/custom_app_bar.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/custom_divider.dart';
import '../../../../../core/shared_widgets/total_price.dart';
import '../../../../../core/utils/images.dart';
import 'custom_cart_widgets/order_info_item.dart';
import 'custom_cart_widgets/payment_methods_bottom_sheet.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const OrderInfoItem(infoTitle: 'Order Subtotal', value: r'$42.97'),
            const OrderInfoItem(infoTitle: 'Discount', value: r'$0'),
            const OrderInfoItem(infoTitle: 'Shipping', value: r'$8'),
            SizedBox(
              height: 16.h,
            ),
            const CustomDivider(
              dividerPercentageFromWidth: 0.83,
            ),
            SizedBox(
              height: 13.h,
            ),
            const TotalPrice(title: 'Total', value: '50,97'),
            SizedBox(
              height: 14.h,
            ),
            CustomButton(
              title: 'Complete Payment',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const PaymentMethodsBottomSheet());
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
