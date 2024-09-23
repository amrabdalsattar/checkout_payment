import 'package:flutter/material.dart';

import '../utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.semiBold24,
        ),
        Text(
          "\$$value",
          style: Styles.semiBold24,
        ),
      ],
    );
  }
}
