import 'package:flutter/services.dart';

import 'app_colors.dart';

class InitialSetupManager {
  static void setUpSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
}
