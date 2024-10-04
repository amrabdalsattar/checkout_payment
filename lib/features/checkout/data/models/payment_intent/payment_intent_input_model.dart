class PaymentIntentInputModel {
  final int _amount;
  final String _currency;

  const PaymentIntentInputModel(this._amount, this._currency);

  Map<String, dynamic> toJson() => {
        'amount': _amount,
        'currency': _currency.toLowerCase(),
      };
}
