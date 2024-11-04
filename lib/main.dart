import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/utils/api_keys.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/initial_setup_manager.dart';
import 'features/checkout/presentation/screens/cart/cart_screen.dart';

void main() async {
  configureDependencies();

  Stripe.publishableKey = ApiKeys.stripePublishableKey;

  InitialSetupManager.setUpSystemUI();

  await ScreenUtil.ensureScreenSize();

  runApp(const CheckoutPayment());
}

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: AppColors.white,
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: AppColors.white),
        ),
        routes: AppRouter.generateRoutes(context),
        initialRoute: AppStrings.cartScreenRoute,
        home: const CartScreen(),
      ),
    );
  }
}
