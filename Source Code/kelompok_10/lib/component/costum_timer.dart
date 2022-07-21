import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../view_model/payment_view_model.dart';

class CostumTimer extends StatelessWidget {
  const CostumTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentViewModel>(builder: (context, state, _) {
      return Row(
        children: [
          Container(
            height: 20.0,
            width: 20.0,
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: primaryColor,
            ),
            child: Center(
              child: Text(
                '00',
                style: whiteTextStyle.copyWith(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            ':',
            style: primaryTextStyle.copyWith(
              fontSize: 12.0,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Container(
            height: 20.0,
            width: 20.0,
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: primaryColor,
            ),
            child: Center(
              child: Text(
                '00',
                style: whiteTextStyle.copyWith(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            ':',
            style: primaryTextStyle.copyWith(
              fontSize: 12.0,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Container(
            height: 20.0,
            width: 20.0,
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: primaryColor,
            ),
            child: Center(
              child: Text(
                '00',
                style: whiteTextStyle.copyWith(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
