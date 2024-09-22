import 'package:checkout_payment/core/utils/app_colors.dart';

import 'core/utils/app_constants.dart';
import 'core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
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
        ),
        routes: AppRouter.generateRoutes(context),
        initialRoute: AppConstants.cartScreenRoute,
      ),
    );
  }
}
