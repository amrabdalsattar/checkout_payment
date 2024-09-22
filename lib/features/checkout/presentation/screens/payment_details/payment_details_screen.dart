import 'package:checkout_payment/core/shared_widgets/custom_button.dart';
import 'package:checkout_payment/features/checkout/presentation/screens/payment_details/payment_details_widgets/custom_credit_card.dart';
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
          const SliverToBoxAdapter(
              child: Center(child: PaymentMethodsListView())),
          SliverToBoxAdapter(
              child: CustomCreditCard(
            formKey: formKey,
            autoValidateMode: autoValidateMode,
          )),
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
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
