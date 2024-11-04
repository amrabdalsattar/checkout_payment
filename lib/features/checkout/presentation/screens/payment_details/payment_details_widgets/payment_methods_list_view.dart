import 'dart:developer';

import '../../../logic/cubit/stripe_payment_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/images.dart';
import 'payment_method.dart';

class PaymentMethodsListView extends StatefulWidget {
  final StripePaymentCubit stripePaymentCubit;
  const PaymentMethodsListView({super.key, required this.stripePaymentCubit});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  List<String> paymentMethodsItems = [
    Images.creditCard,
    Images.payBal,
  ];
  int activeItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53.h,
      child: ListView.separated(
        itemCount: paymentMethodsItems.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (_, index) => SizedBox(
          width: 20.w,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => GestureDetector(
          onTap: () {
            if (widget.stripePaymentCubit.isStripeSelected) {
              widget.stripePaymentCubit.isStripeSelected = false;
              log("${widget.stripePaymentCubit.isStripeSelected}");
            } else {
              widget.stripePaymentCubit.isStripeSelected = true;
              log("${widget.stripePaymentCubit.isStripeSelected}");
            }

            activeItemIndex = index;
            setState(() {});
          },
          child: PaymentMethod(
            paymentMethodPath: paymentMethodsItems[index],
            isActive: activeItemIndex == index,
          ),
        ),
      ),
    );
  }
}
