import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/images.dart';
import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar(
      {super.key, required this.title, this.isFirstScreen = false});
  final String title;
  final bool isFirstScreen;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: AppColors.white,
        leading: isFirstScreen
            ? null
            : Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(Images.backArrow)),
              ),
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            title,
            style: Styles.medium25,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
