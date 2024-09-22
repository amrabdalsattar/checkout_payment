import 'package:flutter/material.dart';

import '../../features/checkout/presentation/screens/cart/cart_screen.dart';
import '../../features/checkout/presentation/screens/payment_details/payment_details_screen.dart';
import 'app_constants.dart';

abstract class AppRouter {
  static void navigationWithSlide(BuildContext context, Widget widget) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          transformHitTests: false,
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    ));
  }

  static Map<String, Widget Function(BuildContext)> generateRoutes(
      BuildContext context) {
    return {
      AppStrings.cartScreenRoute: (context) => const CartScreen(),
      AppStrings.paymentDetailsRoute: (context) => const PaymentDetailsScreen(),
    };
  }
}
