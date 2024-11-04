import '../../../../../core/networking/api_constants.dart';
import '../../models/ephemeral_key/ephemeral_key_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/api_keys.dart';
import '../../models/init_payment_sheet_input_model.dart';
import '../../models/payment_intent/payment_intent_model.dart';
import '../../models/payment_intent_input_model.dart';
import '../../../../../core/networking/api_factory.dart';

@injectable
class StripeService {
  const StripeService(this.apiFactory);

  final ApiFactory apiFactory;

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    const String url =
        "${ApiConstants.stripeBaseUrl}${ApiConstants.createPaymentIntentEndPoint}";

    var response = await apiFactory.post(
      url,
      data: paymentIntentInputModel.toJson(),
    );

    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response);
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Amr Abdelsattar',
          paymentIntentClientSecret:
              initPaymentSheetInputModel.paymentIntentClientSecret,
          customerId: initPaymentSheetInputModel.customerId,
          customerEphemeralKeySecret:
              initPaymentSheetInputModel.ephemeralKeySecret),
    );
  }

  Future<String> createEphemeralKey(String customerId) async {
    const String url =
        "${ApiConstants.stripeBaseUrl}${ApiConstants.createEphemeralKeyEndPoint}";

    var response = await apiFactory.post(
      url,
      data: {'customer': customerId},
      headers: {
        'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
        'Stripe-Version': '2024-09-30.acacia'
      },
    );

    EphemeralKeyModel ephemeralKeyModel = EphemeralKeyModel.fromJson(response);
    if (kDebugMode) {
      print(
          "/n/n************* Ephemeral Key ${ephemeralKeyModel.secret!} **************\n\n\n\n\n");
    }
    return ephemeralKeyModel.secret!;
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> executePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    var ephemeralKey =
        await createEphemeralKey(paymentIntentInputModel.customerId!);

    await initPaymentSheet(
        initPaymentSheetInputModel: InitPaymentSheetInputModel(
            customerId: paymentIntentInputModel.customerId!,
            ephemeralKeySecret: ephemeralKey,
            paymentIntentClientSecret: paymentIntentModel.clientSecret!));
    await displayPaymentSheet();
  }
}
