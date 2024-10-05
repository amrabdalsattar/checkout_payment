import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api_factory.dart';
import '../../features/checkout/data/models/payment_intent/payment_intent_input_model.dart';
import '../../features/checkout/data/models/payment_intent/payment_intent_model.dart';

@injectable
class StripeService {
  final ApiFactory apiFactory;
  const StripeService(this.apiFactory);

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiFactory.post(
      "https://api.stripe.com/v1/payment_intents",
      data: paymentIntentInputModel.toJson(),
    );
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response);
    return paymentIntentModel;
  }
}
