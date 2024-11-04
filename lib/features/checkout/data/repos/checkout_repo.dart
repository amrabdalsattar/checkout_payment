import '../../../../core/networking/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../data_sources/payment_services/stripe_service.dart';
import '../models/payment_intent_input_model.dart';

@injectable
class CheckoutRepo {
  const CheckoutRepo(this.stripeService, this.internetConnectionChecker);

  final StripeService stripeService;
  final InternetConnectionChecker internetConnectionChecker;

  Future<Either<Failure, void>> executePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    bool isConnectedToInternet = await internetConnectionChecker.hasConnection;
    if (isConnectedToInternet) {
      try {
        await stripeService.executePayment(
            paymentIntentInputModel: paymentIntentInputModel);
        return const Right(null);
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    } else {
      return const Left(Failure('Check your internet connection!'));
    }
  }
}
