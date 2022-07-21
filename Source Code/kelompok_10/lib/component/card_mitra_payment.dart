import 'package:flutter/material.dart';

import '../model/payment_method_model.dart';
import '../theme/theme.dart';

class CardMitraPayment extends StatelessWidget {
  const CardMitraPayment({
    Key? key,
    required this.index,
    required this.currentPaymentIndex,
    required this.list,
    required this.isActive,
  }) : super(key: key);

  final int index;
  final int? currentPaymentIndex;
  final List<PaymentMethodModel> list;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 32.0,
      width: 54.0,
      margin: EdgeInsets.only(
        left: index == 0 ? 0 : 16.0,
      ),
      padding: const EdgeInsets.all(
        2.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          width: 1.0,
          color: isActive == true
              ? currentPaymentIndex == index
                  ? primaryColor
                  : greyThreeColor
              : greyThreeColor,
        ),
      ),
      child: Image.asset(
        list[index].images,
        fit: BoxFit.cover,
      ),
    );
  }
}
