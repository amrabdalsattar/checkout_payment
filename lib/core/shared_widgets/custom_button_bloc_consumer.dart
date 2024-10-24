import 'package:checkout_payment/core/utils/app_colors.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/presentation/logic/cubit/stripe_payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/checkout/presentation/screens/payment_completion/payment_completion_screen.dart';
import '../utils/app_router.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumer extends StatefulWidget {
  final StripePaymentCubit stripePaymentCubit;
  const CustomButtonBlocConsumer({super.key, required this.stripePaymentCubit});

  @override
  State<CustomButtonBlocConsumer> createState() =>
      _CustomButtonBlocConsumerState();
}

class _CustomButtonBlocConsumerState extends State<CustomButtonBlocConsumer> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      bloc: widget.stripePaymentCubit,
      listener: (context, state) {
        switch (state) {
          case StripePaymentSuccess():
            isLoading = false;
            AppRouter.navigationWithSlide(
                context, const PaymentCompletionScreen());
          case StripePaymentFailure():
            Navigator.pop(context);
            isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.red,
            ));
          case StripePaymentLoading():
            isLoading = true;
          default:
            isLoading = false;
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: isLoading,
          title: 'Continue',
          onPressed: () {
            PaymentIntentInputModel paymentIntentInputModel =
                const PaymentIntentInputModel(200, 'USD');
            widget.stripePaymentCubit.executePayment(paymentIntentInputModel);
          },
        );
      },
    );
  }
}
