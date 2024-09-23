import '../../../../../core/shared_widgets/custom_app_bar.dart';
import '../../../../../core/utils/images.dart';
import 'widgets/dashed_separator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'widgets/payment_completion_card.dart';

part 'widgets/ticket.dart';

class PaymentCompletionScreen extends StatelessWidget {
  const PaymentCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: ''),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 27, top: 6),
        child: Ticket(),
      ),
    );
  }
}
