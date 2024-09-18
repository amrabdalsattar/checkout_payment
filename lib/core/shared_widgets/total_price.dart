import 'package:flutter/material.dart';

import '../utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: Styles.semiBold24,
        ),
        Text(
          "\$50.96",
          style: Styles.semiBold24,
        ),
      ],
    );
  }
}
