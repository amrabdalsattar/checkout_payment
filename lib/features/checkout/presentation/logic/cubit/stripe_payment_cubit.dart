import 'dart:developer';

import 'package:checkout_payment/features/checkout/data/models/payment_intent/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'stripe_payment_state.dart';

@injectable
class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());

  final CheckoutRepo checkoutRepo;

  Future<void> executePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    emit(StripePaymentLoading());

    var response = await checkoutRepo.executePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    response.fold(
      (failure) => emit(StripePaymentFailure(failure.errorMessage)),
      (success) => emit(StripePaymentSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
