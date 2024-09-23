import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String infoTitle;
  final String value;
  const OrderInfoItem(
      {super.key, required this.infoTitle, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          infoTitle,
          style: Styles.regular15,
        ),
        Text(
          value,
          style: Styles.semiBold18,
        ),
      ],
    );
  }
}
