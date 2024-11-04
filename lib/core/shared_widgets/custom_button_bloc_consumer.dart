import '../../features/checkout/presentation/logic/paybal_logic/paybal_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/checkout/data/models/payment_intent_input_model.dart';
import '../../features/checkout/presentation/logic/cubit/stripe_payment_cubit.dart';
import '../../features/checkout/presentation/screens/payment_completion/payment_completion_screen.dart';
import '../utils/app_router.dart';
import '../utils/dialog_utils.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  final StripePaymentCubit stripePaymentCubit;
  const CustomButtonBlocConsumer({super.key, required this.stripePaymentCubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      bloc: stripePaymentCubit,
      listener: (context, state) {
        switch (state) {
          case StripePaymentSuccess():
            Navigator.pop(context);

            AppRouter.navigationWithSlide(
                context, const PaymentCompletionScreen());

          case StripePaymentFailure():
            Navigator.pop(context);
            DialogUtils.showErrorSnackBar(context, state.errorMessage);

          default:
        }
      },
      builder: (context, state) {
        var transactionData = PaypalManager.getTransactionData(context);
        return CustomButton(
          isLoading: state is StripePaymentLoading,
          title: 'Continue',
          onPressed: () {
            if (stripePaymentCubit.isStripeSelected) {
              stripePaymentCubit.executePayment(const PaymentIntentInputModel(
                amount: 50.97,
                currency: 'USD',
                customerId: '123456Aa',
              ));
            } else {
              PaypalManager.executePaybalPayment(context,
                  amount: transactionData.amount,
                  itemList: transactionData.itemList);
            }
          },
        );
      },
    );
  }
}
