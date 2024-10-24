import 'package:checkout_payment/core/di/di.dart';
import 'package:checkout_payment/core/shared_widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_payment/features/checkout/presentation/logic/cubit/stripe_payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/screens/payment_details/payment_details_widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  StripePaymentCubit stripePaymentCubit = getIt<StripePaymentCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => stripePaymentCubit,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const PaymentMethodsListView(),
            SizedBox(
              height: 30.h,
            ),
            CustomButtonBlocConsumer(
              stripePaymentCubit: stripePaymentCubit,
            )
          ],
        ),
      ),
    );
  }
}
