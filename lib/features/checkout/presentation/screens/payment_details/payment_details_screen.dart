import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/utils/app_router.dart';
import '../payment_completion/payment_completion_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/custom_app_bar.dart';
import 'payment_details_widgets/payment_methods_list_view.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payment Details'),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
              child: Center(
                  child: PaymentMethodsListView(
            paymentMethod: '',
          ))),
          SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 16, left: 20, right: 20, top: 16),
                  child: CustomButton(
                    title: 'Pay',
                    onPressed: () {
                      AppRouter.navigationWithSlide(
                          context, const PaymentCompletionScreen());
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
