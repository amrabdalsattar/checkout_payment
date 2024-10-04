import 'package:checkout_payment/core/shared_widgets/custom_button.dart';
import 'package:checkout_payment/core/utils/app_router.dart';
import 'package:checkout_payment/features/checkout/presentation/screens/payment_completion/payment_completion_screen.dart';
import 'package:checkout_payment/features/checkout/presentation/screens/payment_details/payment_details_widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethodsListView(),
          SizedBox(
            height: 30.h,
          ),
          CustomButton(
            title: 'Continue',
            onPressed: () {
              AppRouter.navigationWithSlide(
                  context, const PaymentCompletionScreen());
            },
          )
        ],
      ),
    );
  }
}
