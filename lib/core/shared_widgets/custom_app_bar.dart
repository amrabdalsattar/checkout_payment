import '../utils/app_colors.dart';
import '../utils/images.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar(
      {super.key, required this.title, this.isFirstScreen = false});
  final String title;
  final bool isFirstScreen;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      leading: isFirstScreen
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(Images.backArrow)),
      toolbarHeight: 80,
      title: Text(
        title,
        style: Styles.medium25,
      ),
      centerTitle: true,
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}