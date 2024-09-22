import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autoValidateMode});
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            cardType: CardType.visa,
            isHolderNameVisible: true,
            labelCardHolder: '',
            isSwipeGestureEnabled: false,
            showBackView: showBackView,
            onCreditCardWidgetChange: (value) {}),
        CreditCardForm(
            autovalidateMode: widget.autoValidateMode,
            inputConfiguration: const InputConfiguration(),
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (creditCardModel) {
              setState(() {
                cardHolderName = creditCardModel.cardHolderName;
                expiryDate = creditCardModel.expiryDate;
                cardNumber = creditCardModel.cardNumber;
                cvvCode = creditCardModel.cvvCode;
                showBackView = creditCardModel.isCvvFocused;
              });
            },
            formKey: widget.formKey),
      ],
    );
  }
}
