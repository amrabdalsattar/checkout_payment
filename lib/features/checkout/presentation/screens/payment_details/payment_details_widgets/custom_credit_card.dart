// import 'package:checkout_payment/core/utils/app_colors.dart';
// import 'package:checkout_payment/core/utils/images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

// class CustomCreditCard extends StatefulWidget {
//   const CustomCreditCard(
//       {super.key, required this.formKey, required this.autoValidateMode});
//   final GlobalKey<FormState> formKey;
//   final AutovalidateMode autoValidateMode;
//   @override
//   State<CustomCreditCard> createState() => _CustomCreditCardState();
// }

// class _CustomCreditCardState extends State<CustomCreditCard> {
//   String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
//   bool showBackView = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CreditCardWidget(
//             obscureCardNumber: true,
//             obscureCardCvv: true,
//             cardBgColor: AppColors.white,
//             backgroundImage: Images.paymentCreditCard,
//             cardNumber: cardNumber,
//             expiryDate: expiryDate,
//             cardHolderName: cardHolderName,
//             cvvCode: cvvCode,
//             isHolderNameVisible: true,
//             labelCardHolder: '',
//             showBackView: showBackView,
//             onCreditCardWidgetChange: (value) {}),
//         CreditCardForm(
//             autovalidateMode: widget.autoValidateMode,
//             inputConfiguration: InputConfiguration(
//               cardNumberDecoration: textFieldDEcoration('Card Number', ''),
//               cvvCodeDecoration: textFieldDEcoration('CVV', 'XXX'),
//               expiryDateDecoration: textFieldDEcoration('Expiry Date', 'MM/YY'),
//               cardHolderDecoration: textFieldDEcoration('Card Holder', ''),
//             ),
//             cardNumber: cardNumber,
//             expiryDate: expiryDate,
//             cardHolderName: cardHolderName,
//             cvvCode: cvvCode,
//             onCreditCardModelChange: (creditCardModel) {
//               setState(() {
//                 cardHolderName = creditCardModel.cardHolderName;
//                 expiryDate = creditCardModel.expiryDate;
//                 cardNumber = creditCardModel.cardNumber;
//                 cvvCode = creditCardModel.cvvCode;
//                 showBackView = creditCardModel.isCvvFocused;
//               });
//             },
//             formKey: widget.formKey),
//       ],
//     );
//   }
// }

// InputDecoration textFieldDEcoration(String labelText, hintText) {
//   return InputDecoration(
//     hintText: hintText,
//     labelText: labelText,
//     floatingLabelStyle: const TextStyle(
//         color: AppColors.darkGreen, fontWeight: FontWeight.w700),
//     focusedBorder: const UnderlineInputBorder(
//         borderSide: BorderSide(
//       color: AppColors.darkGreen,
//     )),
//   );
// }
