import 'package:flutter/material.dart';

import 'app_colors.dart';

class DialogUtils {
  static void showErrorSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
      backgroundColor: AppColors.red,
    ));
  }
}
