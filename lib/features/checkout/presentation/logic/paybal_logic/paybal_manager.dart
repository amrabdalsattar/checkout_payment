import 'dart:developer';

import 'package:checkout_payment/core/utils/app_router.dart';
import 'package:checkout_payment/core/utils/paybal_service/paypal_view.dart';
import 'package:checkout_payment/features/checkout/presentation/screens/payment_completion/payment_completion_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/api_keys.dart';
import '../../../data/models/amount_model.dart';
import '../../../data/models/item_list_model.dart';

class PaypalManager {
  static ({AmountModel amount, ItemListModel itemList}) getTransactionData(
      BuildContext context) {
    AmountModel amount = AmountModel(
      currency: "USD",
      total: "100",
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ),
    );
    List<OrderItemModel> items = [
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: "USD",
        name: "Pineapple",
        price: "5",
        quantity: 12,
      ),
    ];
    ItemListModel itemList = ItemListModel(items: items);

    return (amount: amount, itemList: itemList);
  }

  static void executePaybalPayment(BuildContext context,
      {required AmountModel amount, required ItemListModel itemList}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalView(
        sandboxMode: true,
        clientId: ApiKeys.payPalCLientId,
        secretKey: ApiKeys.payPalSecretKey,
        transactions: [
          {
            "amount": amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
          Navigator.pop(context);
          AppRouter.navigationWithSlide(
              context, const PaymentCompletionScreen());
        },
        onError: (error) {
          log("onError: ${error.toString()}");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
}
