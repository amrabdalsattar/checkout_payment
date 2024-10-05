import 'package:checkout_payment/core/networking/failure.dart';
import 'package:checkout_payment/core/payment_services/stripe_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/payment_intent/payment_intent_input_model.dart';

@injectable
class CheckoutRepo {
  final StripeService stripeService;
  final InternetConnectionChecker internetConnectionChecker;
  const CheckoutRepo(this.stripeService, this.internetConnectionChecker);
  Future<Either<Failure, void>> executePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    bool isConnectedToInternet = await internetConnectionChecker.hasConnection;
    try {
      if (isConnectedToInternet) {
        stripeService.createPaymentIntent(paymentIntentInputModel);
        return const Right(null);
      } else {
        return const Left(Failure('Check your Internet Connection!'));
      }
    } catch (e) {
      return const Left(Failure('Something went wrong!'));
    }
  }
}
