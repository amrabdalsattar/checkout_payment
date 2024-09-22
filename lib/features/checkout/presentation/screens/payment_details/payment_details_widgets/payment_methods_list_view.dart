import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/images.dart';
import 'payment_method.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({
    super.key,
  });

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  List<String> paymentMethodsItems = [
    Images.creditCard,
    Images.payBal,
  ];
  int activeItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53.h,
      child: ListView.separated(
        itemCount: paymentMethodsItems.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (_, index) => SizedBox(
          width: 20.w,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => GestureDetector(
          onTap: () {
            activeItemIndex = index;
            setState(() {});
          },
          child: PaymentMethod(
            paymentMethodPath: paymentMethodsItems[index],
            isActive: activeItemIndex == index,
          ),
        ),
      ),
    );
  }
}
