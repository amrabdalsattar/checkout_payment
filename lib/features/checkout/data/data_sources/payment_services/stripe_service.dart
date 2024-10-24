import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';

import '../../models/payment_intent/payment_intent_model.dart';
import '../../models/payment_intent/payment_intent_input_model.dart';
import '../../../../../core/networking/api_factory.dart';

@injectable
class StripeService {
  const StripeService(this.apiFactory);

  final ApiFactory apiFactory;

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiFactory.post(
        "https://api.stripe.com/v1/payment_intents",
        data: paymentIntentInputModel.toJson());

    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response);
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Amr Abdelsattar',
      paymentIntentClientSecret: paymentIntentClientSecret,
    ));
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> executePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
